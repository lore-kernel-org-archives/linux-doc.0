Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7289D8632B
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 15:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770736449; cv=none; b=S79Sm6x5HG8JIiicOX1VZg6fnunJJ1bwac3c05AmndFYSLM6n/D0/6C6ry0MGrSWYV2s+j4nVp/iYp6x3UbvAG6p43hWNQAqGOK8N6+E8RXQY1zZtNOFr6FJ8SLBvGTrsJj+WXEP2ilqmz5oUia2k2P9zDd9tzIm3EDrlOM59k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770736449; c=relaxed/simple;
	bh=Fky/A0HSLBaPAC2FMAAHg1RwSk2RgsSA58KAaAaNikE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evzS5ps8ve/xtgN3cFHadMSKiiftbuy1ZZg4NA/F8fjCIdk8wY0m/neH9hiwl0HBGjPK/bh9SpRhGtjdOxLeP0G1vkHHNG7apgdghYW7Xc9L8F9NTawZTn8Mz7EveNM5TBUg7uA8yr5Is/VEeBHa6ONhekMR0VNXRwqd8WdwE9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NX1VcfCd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IiW+r+/1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NX1VcfCd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IiW+r+/1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AE86TL2169443
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 15:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J/AjyONAcOKw9fyP71DvmCeZ
	OABxEcpsqNv9Hd6xYDg=; b=NX1VcfCdUZ6k023yTa5nrcUU8+rXqC4qmvc3V+wN
	IvsFXBnkF1DKmJPleq0rG0PC8nNyA3XJ8sYwgGRfSpVd3fNM2htCsX+ujwJhuCAG
	B/1VWlGTHZPq0aLQkoq7zmRM+/3+tl3ZpO6oN1dXvNcnROVbaP3VZebAc4mv1rQo
	HPOdbsPzzMbEveD1CR0Q0MAf5nQGtQNG266CUE6o+DqXMI9X004HzRFVfWw/uDgB
	XCzk42+eQgaeN5EhDnRQI0ucbZqT/i4jmiJDgTsdUCVCQjJZK0/FcyPO2pfRDA7T
	5Ug9Hm7fQBcbRbBg8AJBdcp/QYqygAr0iYCa1TWtTV/a0g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c80drsed5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 15:14:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso2877123eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 07:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770736447; x=1771341247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J/AjyONAcOKw9fyP71DvmCeZOABxEcpsqNv9Hd6xYDg=;
        b=IiW+r+/1BVt2uZpVxp5zWj1KMXsDYrw4MvPQAj4ZWzDHQuP1wzaBGSM8w70WhJhZTc
         3w9G/x8M9tXpCBijxY1Rkc7mXXmFSjfM2cKCeTfB/6smixZAO+xWmdUvb8Tfus2b8fKH
         k/HwYIB9w0rIUwdlfy5J3+PsOYtSDBw8ziwDHf/ULFwoTTpicMA8OFL4btjZe8mN01Kr
         CW9/AD5nXIzb6WaG7AKCLZrh4dR8A/3ZbmgVBuLNqgVTgcsbSE8JAJqGWk4aU6FYprQl
         Kj+AezylS0HmZzMPvRmWhUvQQjKrhtjJRZbupksuC3rurLv/bM3UkgmB6yhqPcFQHtSb
         uHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770736447; x=1771341247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J/AjyONAcOKw9fyP71DvmCeZOABxEcpsqNv9Hd6xYDg=;
        b=jpurP+MqKMJPu87jzfbpuk8vVsAwhkUPX7dKhpAerhFN+rmmPBJGgqvxqO5jtX63PC
         krxzIw+lAdtGj2bKGseQqFxwEmOi7hRJ9BQPPyTOyhVvb7BQC/Kzzfs3KqorMWA3n3qb
         +Ai7n94VbkvOdYkQpKdojTaqA3vmHjwMpU8jLz2riMY2Rxdy6stBG+NWanx1W+L8HDr8
         459k5yKLoCMmP/CWQC4GlxLNWCJOPld8nIDGPLScgMvppjeM2eTE0X+Ve548277F+XPd
         E3dYQqWM6bJYfFJNzU19KzvxNolKXb84m3QeDxfTRxYQkwyoU7p8yxj0KNmEQBbOe3x6
         zTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYBgSSvExYGi/Q7soapHAuHedJpSsuBeG7u95P/niuF0f8W04LpUaanMzBcZrpaviIPP64YSIJ1x8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcnemWZi92G3Sll750pX7vc/ZM1NDANJhaEsTjLVO9PZG1uBt6
	ISuyn+mLPECY0/nYQQ9IH1CfdwwZLi5CJ+0jl2HPRinMbDsCQ+xM1xL6FSNkbaOvwCjpXMklJaI
	+N3bKG3ddKFinVeOD+WeHnOITO2qe0O6Bl+Xo5UVypBN8i/j8uQbYWR69jCBLJd8=
X-Gm-Gg: AZuq6aI7r2ico586Tdvfv/skumGcWt/nSLVenMsc++8Q5lY5GrT5vlYSmxFJSOPb2p3
	+K4s3icX5jJxb+YcWqkyxTqrxdFDdvRkb8XiHuDNwSqxrfD0a75Gn503XiT83PUiexf5CNiESpA
	XABPdgkOt98xSiCHWcVnXr7oU96wxplUvxPnF1jxOXDUtj9iEO5f3V6kGqbHO+YYFvg6FclNgs5
	ZGOP7KRmbWPSTKHIYdhYSO7gmCR19EldDXrgwOpaBwec2Zoi+tjdA+iiM6XbimNRhWa8I91+aAV
	e6ynf/bjooo1Zlx0PUecoRHHhuxcbggmEy2Yk/jCNkhU6jwFaJ4xxBtrUjaWmaI2/G+dqK9R5R/
	wV1QNpHH3+2MCi+yTXHQFQD9oRhfnIP0=
X-Received: by 2002:a05:7301:d19:b0:2b8:3b47:8951 with SMTP id 5a478bee46e88-2ba89c5d6ecmr1033879eec.1.1770736446929;
        Tue, 10 Feb 2026 07:14:06 -0800 (PST)
X-Received: by 2002:a05:7301:d19:b0:2b8:3b47:8951 with SMTP id 5a478bee46e88-2ba89c5d6ecmr1033853eec.1.1770736446266;
        Tue, 10 Feb 2026 07:14:06 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d9c91sm12648462c88.2.2026.02.10.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:14:05 -0800 (PST)
Date: Tue, 10 Feb 2026 09:14:03 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: cpufeature: Add parsing for B
Message-ID: <hguygejzvtgelem453ercld5udahdy6vydkw6skqjqcsnes4fz@ux5w63fezg4s>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
 <20260207-isa-ext-parse-export-v1-1-a64d3a8bc20a@riscstar.com>
 <rbhjt6qmraoxsdur74mhl2ugy7orr2mb237ynq2sxrraqkl5zm@yc6kim3ic6as>
 <CAH1PCMYMrJoYF4i9vFg1MBkMW+9H9p96RMxqdiQFNC3-KS=7YA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH1PCMYMrJoYF4i9vFg1MBkMW+9H9p96RMxqdiQFNC3-KS=7YA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEyOCBTYWx0ZWRfX7E4OuJcDBUec
 MqsoBBBJ95gJLS7Ld2qkXQtAcBX5l2o4e1PCiGikF7sD4cDawbMG/IgloGpYgCabGbxXSxZIsRg
 RtaLwSXUxkrLX6ptR2tagpUW127zHzSDXJPVMaKwZJRnT9RC5EB/Ib7wUPG90iaetpyM5ZlIHkL
 bqvy/BEnIrpRo1431ds+2tLRKUEdm/tsoiqx+Ig8IWxcmKrAiohEKs8MTihQmcgX2mOZdmdYl10
 CgutaT79tGvwuSO6er7/8FkdS0A9Nq0nKRlYS1MkMDjEB0yt4fTA/O9G5anLVWNnz4znYk0j34Z
 Nn0t6byen3Eix8Rs8FhpA7SNER8A1bwL45mpRKIs8y/VUUGABAhuG9LMYeP3SGlKnzKZeMC4hTQ
 nTnOxpUaeFqVAhbhY+UIkA7pjIWZdErOaXQc6DuSHEvRM4oiokNojOhC3na1J8hJKWZcAyH+Rm5
 2WlW0QXWRAsit2oHoOg==
X-Authority-Analysis: v=2.4 cv=fd+gCkQF c=1 sm=1 tr=0 ts=698b4b3f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YXCq-Yzi1OOEYlFisuAA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: 1TShPPnlzb1DYrRHek3KmAmrWkXtUgV6
X-Proofpoint-GUID: 1TShPPnlzb1DYrRHek3KmAmrWkXtUgV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100128

On Tue, Feb 10, 2026 at 04:15:52PM +0800, Guodong Xu wrote:
...
> > [1] https://lore.kernel.org/all/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/
> 
> With the patches in [1], I would drop the duplicated
> ones from my series (5 of them if I counted correctly),
> and keep only the 3 patches which add SHA and other
> S extensions.
> 
> Would you prefer I send a v2 based on your series, or
> would it be easier for you to pick them up directly?
> Either way works for me.

I can pick yours up, which would allow me to get rid of some
TODOs I have in my patch10.

Thanks,
drew
