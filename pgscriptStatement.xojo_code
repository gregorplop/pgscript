#tag Class
Protected Class pgscriptStatement
	#tag Property, Flags = &h0
		AntiStatement As String
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
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
