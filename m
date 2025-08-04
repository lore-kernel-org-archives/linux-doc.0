Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5D01B043A
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 19:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754334591; cv=none; b=NPzZQHZik2mOx8lmZb3iudEsQ9D4lQ3eKX9rpl/udE+y/D6OxLEc5UkagxQegTLWoskBAhA+x2w+5GUB8QV25bm35CrNV6Szz9658uf1rpglbNF5/wihXCF47d+zW5B3tbP6EXIcyN+C08/3LoYfrURWT+uypF5mEsXZA9IomeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754334591; c=relaxed/simple;
	bh=EoqfN+RU6ie7d3cK9su2M9aANqfgOvgis4RwAsxwdIM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJXWE0TZbb6h3utKNStrN10qx21orQp6t/uARY56spr2v3IM7rn+8m2ghSuerwgmqi0KnjLFj41qbqbFDLOC0RO13k/hdjAGJ6nvr+ldURWhGr9IU72G0LKusnGhJSeI2C21nFKsM5UtqI53qPdIApWzZzHdrrq8bXZVuxDq6B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=I2SBtPqC; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="I2SBtPqC"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574J4F7o014745
	for <linux-doc@vger.kernel.org>; Mon, 4 Aug 2025 12:09:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=s2048-2025-q2; bh=CVr4dJoT4GG1Eomf8VBL
	A90t/VLrfXOEcI7JaT4XHqY=; b=I2SBtPqCUgL0pwVPlPkWHU0H827lpFozbzti
	SOYdRsT9nxB5OYHVTDAze1tWxuKLL9R2PkqDr6JwMgpcmqe7n7W2pnxIVAX4Y8HB
	nylx8C96ZRUx0NCGXn3zuu37Szz6lfZSkV/RptDf0YioVBnmvGHBfp83xo8ghQPk
	7yf1pn1Hf573fOWcWS32gnXcq8NYRjTkXwedSoLIbAd5mTGtT0kfHsrgM826jbD1
	U+v0ITxOOIHi4jIKoB2ZppFCcyckG9MPpHXMs0j787+XxVDNAkKW0Wx52J5Yjf8y
	vKKaMbJFbpCAF4C9p83zGAgiSTNg2vlxIJCugD+wY9QdpDL7Ag==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 48ar4gcc5w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 12:09:48 -0700 (PDT)
Received: from twshared21625.15.frc2.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Mon, 4 Aug 2025 19:09:46 +0000
Received: by devgpu013.nha3.facebook.com (Postfix, from userid 199522)
	id B3564654B2F; Mon,  4 Aug 2025 12:09:33 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:09:33 -0700
From: Alex Mastro <amastro@fb.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
        Keith
 Busch <kbusch@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-fsdevel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <kvm@vger.kernel.org>
Subject: Re: [PATCH v3] vfio/pci: print vfio-device syspath to fdinfo
Message-ID: <aJEFbQgzfY6nf5Lc@devgpu013.nha3.facebook.com>
References: <20250801-show-fdinfo-v3-1-165dfcab89b9@fb.com>
 <20250804102559.5f1e8bcf.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250804102559.5f1e8bcf.alex.williamson@redhat.com>
X-FB-Internal: Safe
X-Proofpoint-ORIG-GUID: D5Fb9eDEorA_8SFWyv8Vuy5P4AB_l0Kb
X-Proofpoint-GUID: D5Fb9eDEorA_8SFWyv8Vuy5P4AB_l0Kb
X-Authority-Analysis: v=2.4 cv=bM0WIO+Z c=1 sm=1 tr=0 ts=6891057c cx=c_pps a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=j2pstE2d10wfqDpL5AwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDExMSBTYWx0ZWRfX1vtefu8fTjIw hMapDIIig9sw71JTC0E1i9tzeC93aoTHRenG6rCqqTqSBeTNKG56HaYtPOowqhwqLOhXRDi+BBE G6/EpJpTRAa1y6/wKLE6VPJrzWQgdCZVPZLbwqgChF+srVfGS43980llAG/FSQmThVd0oxYJBvg
 PAS5d0inpZwEAG+UIVEhcYqq/G5LS2R/tPjt3Yj4mKiQr1cxudjjiXil6DYTwPZInr5R1DJjcGX i16k7u+r4uJ4O5/9ty/JOj6Jf9I15laW4t/YbEC50ZiZz77X8pqqeftdfCkeWA+tQEudjckG6gC UVUkoco37sBp6sP4OJTTjnt+KMvh1wjLfbMe8QnCZhlPxtk7XrOooXaeUNkfqnrilvGXaSieTWR
 HC+H64zC/QPles/KDxrZ9XSmSxIesSwqqg8m4WmjO8wnea+wdgO8h+hzK+jnsbLUNMWB/mDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_08,2025-08-04_01,2025-03-28_01

On Mon, Aug 04, 2025 at 10:25:59AM -0600, Alex Williamson wrote:
> Changes in this file look spurious, vfio_device_ops vs
> vfio_device_fops?  Nothing implements or consumes the vfio_device_ops
> callback here.

Agh. Yes. I missed removing this. Fixing in v4.
