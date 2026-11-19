Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.96.220.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076555;
	b=Q04XdkSGBmZvoun/FuSfGX6l5mDKH5aJKibEtyY/93VQrluNz1xKcMJ6NGTGY6cNRCbh
	 hj/OkI+iF0wgL90NLXJj12m3R9uIGL7d89ZRf8n6VhnLpyo54+UlYv9Cvd2nd0te0Oo3R
	 QE2k7Lxgc3BZ+MygBWnpuIIzf+WgisaZ1r7ZAToV7zBz++fAQ3CTMFaeVOIkniCCwW8om
	 pD7jWNq4DiFl4rHlfPLhue5m7q0hOKkVpckJdLyN2Kd96GqKYeB1Q6nczcDQK5uX6yGAr
	 UxkgWXhmCctNrpJTQ9kp/g5RiBAZDvsB9K9SzdM8Q1DVxfo9XSDbuok7tX4No2XrhGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076555;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:DKIM-Filter:
	 DKIM-Signature:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy;
	bh=pMQ5M6Z2yRdmtQ9M85Giwa2zSEIEhUWjaO2j3nALptg=;
	b=u0gsHyVILmofLqhqxEN8a64m3SXlXnRo4iCVeNjIWrqHn/vCNqdVVsQh81OqZbU1e4cF
	 P6r6/iz88moY/KIO+z1bJ3IdKMz2wrf3N5eXpr0uLlg+U9xvvLGAKZtqBTNvcW/jroNOp
	 u9u1Pp5/MEuCrRu6PuyemeFJXfTA6uFLh67+1ViMYDSmqDZKq40Ni2as61DdE38YNKqC8
	 ogddYXmN/+YtPPdQFuUK+muMa7nkICa11Q8FeuO3bN3iWQIwBby1yedmeEL7QEDKCSClM
	 FJrSpyktbrppQ2MK+A5IoricSdes8tQamANwVMjjLTkRi6E/+zNb6EiWtLAg4/TRGkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=secunet.com;
	spf=pass smtp.mailfrom=secunet.com;
	dkim=pass header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=yx0s1ySI;
	arc=none smtp.remote-ip=62.96.220.36
Received: from mx1.secunet.com (mx1.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52D606A320;
	Thu, 19 Nov 2026 08:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C52D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secunet.com header.i=@secunet.com header.a=rsa-sha256 header.s=202301 header.b=yx0s1ySI
Received: from localhost (localhost [127.0.0.1])
	by mx1.secunet.com (Postfix) with ESMTP id 52E5E206D0;
	Thu, 19 Nov 2026 09:22:26 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from mx1.secunet.com ([127.0.0.1])
 by localhost (mx1.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0tULRf1F0gPG; Thu, 19 Nov 2026 09:22:25 +0100 (CET)
Received: from EXCH-01.secunet.de (rl1.secunet.de [10.32.0.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.secunet.com (Postfix) with ESMTPS id CE04A206B0;
	Thu, 19 Nov 2026 09:22:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.secunet.com CE04A206B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1795076545;
	bh=pMQ5M6Z2yRdmtQ9M85Giwa2zSEIEhUWjaO2j3nALptg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:From;
	b=yx0s1ySI8PaU/LJQk81demn1M6WLvC8dLAinCgrxfOz5Lwe1StN+6Zu5P5pi6rFVI
	 QsvirCn/jdp/yWuyRJ+DG9FTb50yqB0opDFEijQfWEjjZ+h/47gNC/jdnen+lNsvKA
	 KToXulbQTIk5St8ZJ0xCa2C74mgFU0gjhk01IxzVhR67SrlWMSy6pbhEIdPtNTuyM7
	 wYG+aNZ4ZkRfyjQlZ8hP/YaNOwHxSkkYAHvippkB2EVZ/f7WVQL8j8NaOdheUxE3lE
	 NzOerTzFQKohPDVG2WUjpGVLh7ErPxLCG6qupzIWfyB7fL/daorpx3AeJdN+WMAD5w
	 StZNlHbztWoAQ==
Received: from gauss4 (10.182.7.102) by EXCH-01.secunet.de (10.32.0.171) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 19 Nov
 2026 09:22:24 +0100
Received: (nullmailer pid 296165 invoked by uid 1000);
	Thu, 19 Nov 2026 08:22:24 -0000
Date: Thu, 19 Nov 2026 09:22:24 +0100
From: Steffen Klassert <steffen.klassert@secunet.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>, <netdev@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH ipsec-next] docs: xfrm: Fix the two aevent sysctl paths
Message-ID: <av6xwBXE2hlTpS7y@gauss4>
References: <20260905104625.43722-1-kmehltretter@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260905104625.43722-1-kmehltretter@gmail.com>
X-ClientProxiedBy: EXCH-02.secunet.de (10.32.0.172) To EXCH-01.secunet.de
 (10.32.0.171)

On Sat, Sep 05, 2026 at 12:46:25PM +0200, Karl Mehltretter wrote:
> The sysctls are registered as xfrm_aevent_etime and xfrm_aevent_rseqth
> under net.core (net/xfrm/xfrm_sysctl.c). The document calls them
> sysctl_xfrm_aevent_etime and sysctl_xfrm_aevent_rseqth; those names
> appear nowhere in the code but in a comment in net/xfrm/xfrm_user.c and
> were never the proc file names.
> 
> Use the proc file names.
> 
> Fixes: b8a99520f78e ("[XFRM]: Add documentation for async events.")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Now applied to ipsec-next.

Thanks a lot and sorry for the delay!
