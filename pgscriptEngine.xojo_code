#tag Class
Protected Class pgscriptEngine
	#tag Method, Flags = &h0
		Sub Constructor(initdb as PostgreSQLDatabase)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = License
		pgscript - A simple PostgreSQL script engine
		--------------------------------------------------
		(C) 2019 George Poulopoulos
		Released under the MIT License
		
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		db As PostgreSQLDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		LastError As String
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
			Name="LastError"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
