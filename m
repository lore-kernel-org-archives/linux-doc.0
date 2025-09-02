Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E1D33A03A
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834321; cv=none; b=A8Qa/AJ+D6hZ+eSZ751TYIlhVKospg+DuoDe3R1Q87BtWEGmB/47UTEtp/1D6QW25zoGMTVjAWNpkmtnrK7W4ce39wQhSGBlALpfNyKJ+asFq/Srl+npE16RH4n7rESaXoCXGuKw5+vkGE1aDrQZR5sk2HDQnFtG5xLDXmUicPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834321; c=relaxed/simple;
	bh=fyhvFcpbjARgFVrpZiyVBsf0zhuVsLRUp086qBgwZ1o=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpxcqZnVikxHyjaVBhs+Ct0+bpsnFF292AurWZl3MiVP2I+8i8LBbtdMB7BcRKDwRkgl16lijIsLIdWC2Zch+EWO4sv89Tz5Xv/DuJaXkb18XzCE5xAIO4ggxqeL/uPl8nZQyn+/155wZeA7xb7KNBhHdJERWZ3jRKw46yp/BLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=tspr7NYt; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="tspr7NYt"
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 582Ehwfj3376448
	for <linux-doc@vger.kernel.org>; Tue, 2 Sep 2025 10:31:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=fyhvFcpbjARgFVrpZiyV
	Bsf0zhuVsLRUp086qBgwZ1o=; b=tspr7NYtRRiQvcHbnxghNDXIIPdapc3PUnIk
	cIDQaHktD/MKuD8HnUT7Ttvh72+h4PlmLypco/r5D6WHXidKm43ZnZTrl4H9CtLZ
	707CWn7ShgeIRGwdG4ZreMs+6OF60bmACL0nfNrVmryMKTClBaJ1sXEE+qfpu+Ru
	uiyd6h5RMlnQtGFUjFzrXc7Hui4QPJHCio6ungeJMKYg9pLg16BOFglbHnRp5GAg
	ruRKfLPsUoEjC46MDc17JP5WIDxUakG7cwav/W2TbdiSvBpDmghspLR2XCI3O+7a
	ZKNlj+iQlVZAC/RJmDNKkCK5JdA7AuBzED3vS3EDTJXdC6r9XQ==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by m0089730.ppops.net (PPS) with ESMTPS id 48x2km1j4n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 10:31:58 -0700 (PDT)
Received: from twshared28243.32.prn2.facebook.com (2620:10d:c0a8:1b::2d) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Tue, 2 Sep 2025 17:31:56 +0000
Received: by devgpu015.cco6.facebook.com (Postfix, from userid 199522)
	id 29DFD7609C4; Tue,  2 Sep 2025 10:31:45 -0700 (PDT)
Date: Tue, 2 Sep 2025 10:31:45 -0700
From: Alex Mastro <amastro@fb.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Stephen
 Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] docs: proc.rst: Fix VFIO Device title formatting
Message-ID: <aLcqAXrrYz8McAfs@devgpu015.cco6.facebook.com>
References: <20250828203629.283418-1-alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250828203629.283418-1-alex.williamson@redhat.com>
X-FB-Internal: Safe
X-Proofpoint-GUID: lMdtVG2epthr66d6unMWaydGlmCUJr1q
X-Proofpoint-ORIG-GUID: lMdtVG2epthr66d6unMWaydGlmCUJr1q
X-Authority-Analysis: v=2.4 cv=Z4fsHGRA c=1 sm=1 tr=0 ts=68b72a0e cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=FOH2dFAWAAAA:8 a=AqKOC74haZqJEwbFGksA:9
 a=CjuIK1q_8ugA:10 a=Qzt0FRFQUfIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDE3MyBTYWx0ZWRfXyyPWx52Dw2Fu
 L7kw9D1fOHFK4OLpngZAsm+1ZFCiwF6cB46g/32ObmScMbKA9/TXTOC+ztSpwE1Hdb5ZwMA+f8x
 4ope4GOhUfqq8Gr+73mnd1hyEMYtSSERa4WlYgSbKFHwgt8ZgcZpuRhVoErHb6MPdhMNLZkYDwI
 khR7ZgKJzx/U89NuToeorBft11otlfDjhUzvu46Y/kdOhnO6UE+4IdC9VaqjphDgt5LqUkkco4Z
 I+yWmbaw5X5mvmueI3mDxp7dJw/9QnaaUEZb2hE9c6PNzeyXQH+mc/Im+zA8GDlt4VfMfJbk51N
 aPgtAh06MXVsP2v+06a69KHWMlk9f/QTN3QVE6CEeFHECZyUk55pUd377531Fs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01

On Thu, Aug 28, 2025 at 02:36:24PM -0600, Alex Williamson wrote:
> Title underline is one character too short.

Shoot. Apologies for missing this, and thanks for the fix. I should have run a
`make *docs` flavor as part of validating this.

Reviewed-by: Alex Mastro <amastro@fb.com>
