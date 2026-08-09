Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84231F16B
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 05:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786253010; cv=none; b=hGdNEuc5ONWRXnuEsfr+TL3Z8sIm4kZmK2JB9hXl9S+RLIqbKojz6Oyn/Lam20DbGQoP8gWQgklEYYuG6DPrQ22T4/OTN8CRh4INTdg1qi/Q22pEX8qYOLpDL4JYWhvdrKUk/OrbfrYYWN4Aw898L0xFRKdBZsGbVtkOAyDyPRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786253010; c=relaxed/simple;
	bh=foEWB4ZpjsCiGkwdZGLQ1AM6GMtCKPkRua3gXyFQfGk=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=fIhUYqOq3SLsyHDD2SyzSzYFHufyFZ4m3gt/lkKVcHktUVa3tf279CNaIjyJ8pHnoY9KfXOFcS1HXVxH9U690M1MwF69IgV/ORXTbW/kKLklWbbM+7pXoUYCbgHVq76MjC0UM0zaZjnqpjLL+n5SWgyXKDjJcLLYjSfSkVnhJlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V9DLJcRG; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V9DLJcRG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Subject:From:To:MIME-Version:Date:
	Message-ID:Content-Type:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=fanxUD+IGZxD7KUmry2WUyvi9wBdM2ksuQOnPSEBhx8=; b=V9DLJcRGnK+V4hRfaJvpYfJmDE
	9nx+/SCUu0oxwuSXmomjpUYR/Q3WIBbYIU04UTnw4fohib0kr1ZfjbqKumu12e6qQBTTl9IhRO9Y5
	kqYmzHgRlMDDGyqnTKJTrhJQ356HEMtZx4yAElJXCJth2curMeEqFUd1R/3xh65JTP1KnZ+U9ecQp
	bi7eZOTrw3zigBDXo5G9l1VTlmaUotdFQVVYb80b3Qz0i28BjIafG89ZXuNr3I5jIM3wOg68q2qW9
	/f6HCHNeynIcGwYrJWOTmash8ovoXShOY0nKc6dP0DFn0Dg6HUIa4KkZIWELjUkcSO6pRgT83G7Dc
	TNcP9dEA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsw0C-0000000A0zb-2psD;
	Sun, 09 Aug 2026 05:23:16 +0000
Content-Type: multipart/mixed; boundary="------------k0wpCB11z23Cg6dC5FcWPzZH"
Message-ID: <fc7978bb-a71f-456d-84bb-670c8f0426ed@infradead.org>
Date: Sat, 8 Aug 2026 22:23:15 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: kernel-doc -man -e confusion

This is a multi-part message in MIME format.
--------------k0wpCB11z23Cg6dC5FcWPzZH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

(testing with linux-next-20260807:)

When I run
$ ./scripts/kernel-doc -man -e include/rdma/ib_mad.h
(this header file has no exported symbols),

it appears that kdoc_output.py::out_tail() is called for
each non-exported symbol. This looks extraneous to me.

Can you fix this so that out_tail() isn't called for the
non-exported symbols?

Secondary comment: I save the kernel-doc -man output to
ibmadexp.man and then run
$ man ./ibmadexp.man
(which is attached)

where I see the out_tail() output, **except** that the
SEE ALSO: line isn't printed (displayed) by the man command.
Is there a problem with the generated line
.SH "SEE ALSO"
?
Maybe it needs a blank line before it or some other kind of
formatting assistance or something around it is confusing the
'man' command?

thanks.
-- 
~Randy

--------------k0wpCB11z23Cg6dC5FcWPzZH
Content-Type: application/x-troff-man; name="ibmadexp.man"
Content-Disposition: attachment; filename="ibmadexp.man"
Content-Transfer-Encoding: 7bit

Warning: include/rdma/ib_mad.h:330 expecting prototype for ib_set_cpi_resptime(). Prototype was for ib_set_cpi_resp_time() instead
Warning: include/rdma/ib_mad.h:465 cannot understand function prototype: 'struct ib_mad_send_buf'
Warning: include/rdma/ib_mad.h:484 function parameter 'hdr' not described in 'ib_response_mad'
Warning: include/rdma/ib_mad.h:535 function parameter 'ib_mad_send_handler' not described in 'void'
Warning: include/rdma/ib_mad.h:535 expecting prototype for ib_mad_send_handler(). Prototype was for void() instead
Warning: include/rdma/ib_mad.h:550 function parameter 'ib_mad_recv_handler' not described in 'void'
Warning: include/rdma/ib_mad.h:550 expecting prototype for ib_mad_recv_handler(). Prototype was for void() instead
Warning: include/rdma/ib_mad.h:567 cannot understand function prototype: 'enum'
Warning: include/rdma/ib_mad.h:592 cannot understand function prototype: 'struct ib_mad_send_wc'
Warning: include/rdma/ib_mad.h:606 cannot understand function prototype: 'struct ib_mad_recv_buf'
Warning: include/rdma/ib_mad.h:626 cannot understand function prototype: 'struct ib_mad_recv_wc'
Warning: include/rdma/ib_mad.h:647 cannot understand function prototype: 'struct ib_mad_reg_req'
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_free_send_mad\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_mad_kernel_rmpp_agent\fR(9)
.SH "SEE ALSO"
.PP
Kernel file \fBinclude/rdma/ib_mad.h\fR
\fBib_get_cpi_resp_time\fR(9),
\fBib_get_cpi_capmask2\fR(9),
\fBib_set_cpi_capmask2\fR(9),
\fBopa_get_cpi_capmask2\fR(9),
\fBib_response_mad\fR(9),
\fBib_get_rmpp_resptime\fR(9),
\fBib_get_rmpp_flags\fR(9),
\fBib_set_rmpp_resptime\fR(9),
\fBib_set_rmpp_flags\fR(9),
\fBib_register_mad_agent\fR(9),
\fBib_unregister_mad_agent\fR(9),
\fBib_post_send_mad\fR(9),
\fBib_free_recv_mad\fR(9),
\fBib_modify_mad\fR(9),
\fBib_cancel_mad\fR(9),
\fBib_create_send_mad\fR(9),
\fBib_is_mad_class_rmpp\fR(9),
\fBib_get_mad_data_offset\fR(9),
\fBib_get_rmpp_segment\fR(9),
\fBib_free_send_mad\fR(9)


--------------k0wpCB11z23Cg6dC5FcWPzZH--
