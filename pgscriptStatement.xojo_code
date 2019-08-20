#tag Class
Protected Class pgscriptStatement
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(newStatement as String, newAntiStatement as String, optional RollbackHere as Boolean = false)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AntiStatement As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Error As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorCode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		LastExecuted As Int64
	#tag EndProperty

	#tag Property, Flags = &h0
		RollbackOnFail As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Statement As String
	#tag EndProperty


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
			Name="Statement"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AntiStatement"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastExecuted"
			Group="Behavior"
			Type="Int64"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RollbackOnFail"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
