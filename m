Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C5226299
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 04:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776830458; cv=none; b=UseoeKzCrZNvu8I/Pd7SnNNfAwiqWvd6G4r8h06JE2d2c/t4UHPpLE373uJAlO9dVQy0qb3y57CjG5fRAc1+k9d9KAi1O5NM81glgQ2ZS/wd/zCyCxFZGnS/+uQJ98wzfl5TTBfs8124SaIkljYAqi5GadvXHw1G6s467ZrB07Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776830458; c=relaxed/simple;
	bh=AusVYhm9nnKMHeSTStp7R4o08y5ZH5NVdmw0W4H+Fw0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=lQWy6nsrOR7ZHN6JdEv/QEjZvpz5IUCnH5/oGg+3c21QQ89MlUOImBSd8uLExN/eS7TO+ZeZfXe31apzhlnWG5CplZa9TMPRRRkDyRJAqs9hEKKyIgR4JtN/mj2KKdIfyD12zZa4pcUFxyxazSwQFGx0QJEt1yRrHwMB0Fwb0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FUPP119v; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FUPP119v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GO8nULLg74be+p3pZJO8IP4/BQNIWmOEtht7SuvdQbE=; b=FUPP119vXjvYJ3GMixNSDgAsDn
	KJJtHqNhyk/59jbj5NXpy/L9KbCZOQURZJjreSISqSxDL4DD6Uvl6Ltupio3wWgvWuTuUgkwdUhaa
	xrj4XVJEf1ojweMQWKo8dDLcc/hLZLLN2Yd+XsWlzkGcVfWeKWq8qACOLPn195LSLWMxXZmropbOt
	yW46T9dpBTFRCihEJcH6easub3EQ9zbsSi5ss+Jv1tucFBdpczFg0dTLGfZCz4KV4B1NGyjCFkkTP
	8Zb2nku++YmVlgJ6r/4+GPy8fakZxQ7E+5GIzahdgDkAFxGoeJ9r2A34IrapQk/8K8xHbWh4JIitz
	w8KVo/Xw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFOlg-00000009ZPe-3o4P;
	Wed, 22 Apr 2026 04:00:52 +0000
Message-ID: <7658a519-1f2e-4383-99c7-20933d3eba04@infradead.org>
Date: Tue, 21 Apr 2026 21:00:52 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: kdoc for DECLARE_PER_CPU()
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

I have a simple patch to support DECLARE_PER_CPU() usage for
include/linux/netfilter/x_tables.h, where 'make mandocs' reports

Warning: ../include/linux/netfilter/x_tables.h:335 function parameter 'seqcount_t' not described in 'DECLARE_PER_CPU'
Warning: ../include/linux/netfilter/x_tables.h:335 function parameter 'xt_recseq' not described in 'DECLARE_PER_CPU'
Warning: ../include/linux/netfilter/x_tables.h:335 expecting prototype for xt_recseq(). Prototype was for DECLARE_PER_CPU() instead

First change the kernel-doc for the variable to use "var xt_recseq"
(add the leading 'var' string):

@@ -326,9 +339,9 @@ struct xt_table_info *xt_alloc_table_inf
 void xt_free_table_info(struct xt_table_info *info);
 
 /**
- * xt_recseq - recursive seqcount for netfilter use
+ * var xt_recseq - recursive seqcount for netfilter use
  *

and then add to var_xforms:

--- linux-next-20260420.orig/tools/lib/python/kdoc/xforms_lists.py
+++ linux-next-20260420/tools/lib/python/kdoc/xforms_lists.py
@@ -117,6 +117,7 @@ class CTransforms:
         (CMatch("__guarded_by"), ""),
         (CMatch("__pt_guarded_by"), ""),
         (CMatch("LIST_HEAD"), r"struct list_head \1"),
+        (CMatch("DECLARE_PER_CPU"), r"\1 \2[PER_CPU]; }"),
 
         (KernRe(r"(?://.*)$"), ""),
         (KernRe(r"(?:/\*.*\*/)"), ""),

(or the [PER_CPU] could just be "[]").

If I look at the -man output, it says:

var xt_recseq(9)               Kernel API Manual               var xt_recseq(9)

NAME
       xt_recseq - recursive seqcount for netfilter use

SYNOPSIS
       DECLARE_PER_CPU(seqcount_t, xt_recseq);

However, I expect the SYNOPSIS to be more like
	seqcount_t	xt_recseq [PER_CPU]; // or "[]" here


Do you see, can you explain why the xform isn't happening as I expect?
Or should I just not expect that xform?


[testing on linux-next-20260420]

thanks.
-- 
~Randy

