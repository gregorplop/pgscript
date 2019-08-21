#tag Class
Protected Class pgscriptEngine
	#tag Method, Flags = &h0
		Sub Constructor(initdb as PostgreSQLDatabase)
		  db = initdb
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastPosition() As Integer
		  Return Statements.Ubound
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadReplacements(newReplacements as Dictionary) As Boolean
		  EngineError = ""
		  if IsNull(newReplacements) then 
		    EngineError = "Replacements table not initialized!"
		    Return false
		  end if
		  
		  Replacements = newReplacements
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadStatement(newStatement as pgscriptStatement) As Boolean
		  EngineError = ""
		  if IsNull(newStatement) then
		    EngineError = "New statement not initialized!"
		    return false
		  end if
		  
		  Statements.Append newStatement
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Replace() As Boolean
		  if IsNull(Replacements) then
		    EngineError = "Replacements not initialized!"
		    return false
		  end if
		  
		  for i as Integer = 0 to Replacements.Count - 1
		    for j as Integer = 0 to Statements.Ubound
		      Statements(j).Statement = Statements(j).Statement.ReplaceAll(Replacements.Key(i).StringValue , Replacements.Value(Replacements.Key(i).StringValue).StringValue)
		      Statements(j).AntiStatement = Statements(j).AntiStatement.ReplaceAll(Replacements.Key(i).StringValue , Replacements.Value(Replacements.Key(i).StringValue).StringValue)
		    next j
		  next i
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  EngineError = ""
		  for i as Integer = 0 to LastPosition
		    Statements(i).Error = false
		    Statements(i).ErrorCode = 0
		    Statements(i).ErrorMessage = ""
		  next i
		  
		  if LastPosition >= 0 then Cursor = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Rollback() As Boolean
		  EngineError = ""
		  
		  if IsNull(db) then 
		    EngineError = "Database session not initialized!"
		    return false
		  end if
		  
		  if Cursor > LastPosition then
		    EngineError = "Cursor points beyond last position!"
		    return false
		  end if
		  
		  if Cursor < 0 then
		    EngineError = "Cursor has already reached the beginning!"
		    Return false
		  end if
		  
		  dim StartPosition as Integer = Cursor
		  
		  for i as Integer = StartPosition to 0 step -1
		    
		    Cursor = i
		    
		    if Statements(i).AntiStatement.Trim <> "" then
		      db.SQLExecute(Statements(i).AntiStatement)
		      if db.Error then
		        Statements(i).Error = true
		        Statements(i).ErrorCode = db.ErrorCode
		        Statements(i).ErrorMessage = db.ErrorMessage
		        return False
		      end if
		    end if
		    
		  next i
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run() As Boolean
		  EngineError = ""
		  
		  if IsNull(db) then 
		    EngineError = "Database session not initialized!"
		    return false
		  end if
		  
		  if Cursor > LastPosition then
		    EngineError = "Cursor points beyond last position!"
		    return false
		  end if
		  
		  if Cursor < 0 then Cursor = 0
		  dim StartPosition as Integer = Cursor
		  
		  for i as Integer = StartPosition to LastPosition
		    
		    Cursor = i
		    
		    if Statements(i).Statement.Trim <> "" then
		      db.SQLExecute(Statements(i).Statement)
		      if db.Error then
		        Statements(i).Error = true
		        Statements(i).ErrorCode = db.ErrorCode
		        Statements(i).ErrorMessage = db.ErrorMessage
		        return False
		      end if
		    end if
		    
		  next i
		  
		  return true
		End Function
	#tag EndMethod


	#tag Note, Name = License
		pgscript - A simple PostgreSQL script engine
		--------------------------------------------------
		(C) 2019 George Poulopoulos
		Released under the MIT License
		
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		Cursor As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		db As PostgreSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		EngineError As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Replacements As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Statements(-1) As pgscriptStatement
	#tag EndProperty


	#tag Constant, Name = projectLink, Type = String, Dynamic = False, Default = \"https://github.com/gregorplop/pgscript", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EngineError"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Cursor"
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
