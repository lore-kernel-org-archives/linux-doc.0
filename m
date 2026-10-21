Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601530;
	b=OyN3o1FM2b4UgSPZS/7ibCotA1CIgxz6oRowxg9PeMpqUJMcB0I6AysS/AAOnVSThD7B
	 z6GCQLc23IAfZ0h2oRvE8/4/mqh63R06Jei1Xt+7gCzXM8jAa1pDJGC6mDLcRQ9DNqMKr
	 2ApmzO3C3YVe8QrdB5/2LKCgCIstUVak+x7NS215UMoNQqB4YM1DNsTg88KH7Hy+hd6gv
	 tXhHC8WtjGnppJ9rXsHf//d0v6hxNvc7kEl+F/hemTlDpV3rbR6Hifzyeou/3YxHY3Crc
	 cCJlVVk+C8dzQE9fDA8K9Q/T1/+1nqcwGb2VyK1fheg8adJqKEyw5kNhLTet25sedNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=;
	b=arHh2yg8RC16AzVZQf0RpbwRJ2F6BzEVQ5KCoX9AyoJFTd6iP1ZyJzpioSWR+p5Id/pS
	 VDWJTk/Jp2u3PshYWumqlo4XCof6MO533gev4KZVk8rL6Ac9f35ayNxTVuZe5wE4AprfM
	 BgZoYkWLXxDL1PqJKTQaqHAMNM7SNu6JTKtu02Gj6GDFYFoIPjeOURqHiF20gm8K4Bb+7
	 vhY3otPaeabwZtPSu5Eg3ETX/Rq7im7DWXpDJnMwsqthnoe6Og1QooHi+tQDEv5mJumpF
	 dRpq2QFd2B7hzoTT3eBy4yumD32dvSEcJVH8sG/jkIS2V4hgFyubRuLaX2WB//CcHSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGBW0L6P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQjpQpmx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430E0606A31F
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 430E0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGBW0L6P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QQjpQpmx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFTwkU4158357
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=; b=fGBW0L6PCB1n3raX
	d/aUhPmemf5kyrJMb2V994vfSQxb8ZW1AUflWoJbMqxkNdQMkyX60NaRpWzwG2ZR
	dyDNPyramva9fABPmwqppOy5x+y3G2Xjpzu+HJAQ8qTdGMQEDtxA5BLJJps0Gfbc
	0RS6PuOx2PIHdwu3bJdDo33JYwkVD1p+N8Eahl+8OsJIsrCWmXNci7Ks5pmN/stb
	gumg0KOS4MOx3tLDNhDJjMnuFbAjLxfI2H6AicbgZ1SvXdgPAikr3eeNDm/5NzI1
	ReUtxdLTy3hBPhb9/wjImsppuSRvPHiJNWyrz7U7vS8e4LyChMQCIA5S5oPDbcDF
	hGURjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8xy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 16:52:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so2170750eec.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601527; x=1793206327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=;
        b=QQjpQpmxczgrpr2meAC6qTgPsJ4ZmJ91pnxGxL09Sesa1rfJJ+QmYIiqzX/3ZN2Whc
         PGHUczg9OAvRA0sX9sIDqu77sBzAiBbu7jGYKhjLqjsw2zunSyFSZrk/9dIw43rWgx87
         IVATm2JqsZfxBJA4hz7gvE+ZQkKi5tu3ZcAv3WPj72XLC61Kfbn/vxwFtyI0+LKC4Fg9
         N7c6i0MEQt4EgFAEAjH6SeD6iQGD2AApA1yq+2zxXGXf/7tUfU8F3yLM6Mcr02afFF0F
         fC6EP1lR68xmmprG7i052+aNcNNEAIDBPU11lgff4/LOklidQA8lbZ0lsxRZbkFmV+xj
         424g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601527; x=1793206327;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Qwd5IeDpUYoKVbi14CXRmp0vCTcpiIpKFvrCb+PUaQ=;
        b=uJZsw1fRkAUagH0Zw/f78r6x/zr97e713whkK6BlRFZYlJ0yTBsCyLiO4mAZo8OFhn
         Dvx76eOus0Zlo1EzodFq5vBA+b4EET/MM4s/jSelT1/SfxbkZsz+vJzFuUjY0+trp6T5
         YD/UvGSgCKc0PbhYHCwOec5qNxkL7xiw83fUxaceEdja7oYxJvTbVc5rPekIiKgtnQBR
         r9ETaDZToyO1Fb1EXntxFt6RyiL8VqCtR1vCtdZt6p6yyURCu7aJc7YfiMa59/qCiQgW
         H4ZrxnoN4WtpHy1EQSvCiLWe7yEx2WG6+NOHu0cE62B0MeAU/5eZrVRx6Dkn+zb3dmTl
         AkXw==
X-Forwarded-Encrypted: i=1; AKwUvBwY7TzNLL/e6PLrM9rhZZvh0cXHElbvTkySR+pkB2nzPSX66HnVpxgc0IkxRGz2yy9xjBaA8kPt11g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDMRe8BZzYM2H94RhmIWaW8Vco7pOSmMpE17S7GSO9yxTUGYLd
	39FEDcH0gEg8kvGM5Ql7XMjH42alFnDJd+oyrDM77+v4X/1sjIy2fjL16p/ahiYOZkoLZeWT582
	X4N3P9J+OjTFC84Uu+natk9K6XSpjjVwGi4Lj7oMl9bI3OOgR+7L2gVT6rh5ZkpI=
X-Gm-Gg: AYBFou3Y7km02vTsZKdPWQIhlzzukKzPHZg1zcdKrJo+kJA/+Fkftm6PlYXw/S17l+q
	93/JKwLC9dgwzTpn6ZB2yAsY/m5npBsZ4OnbIND3uV3Cne+Q1MKNmQNKx9g1GEfu6fK2jabng63
	uQICOKfYHJJ+xePKgW5gTfJAj7lbfs2wK5CvSkcMTdAIqyB7BgjumOcppZexSorTApQNlO1iJ1q
	anskcgrdUYfJOIgO1rpnM4triyVkQd09PP7OylwSiSObVuo0B0xxV+iYxYYGbir9eX3ROLL5Oy/
	WNrLw67PZ9R3pdCF3eXgdsRqShgDCNUuYC11eIFVUuPBdK5mDUqsde4YbCaAzxMNN60RhvHBv/9
	ZwyMEt+vCApAYDxY6IuQ8DixjJ3Vpb1YfxTIY8E+HMQ==
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id 5a478bee46e88-3674c43c286mr5506648eec.10.1792601526892;
        Wed, 21 Oct 2026 09:52:06 -0700 (PDT)
X-Received: by 2002:a05:7300:fb83:b0:359:8492:2107 with SMTP id 5a478bee46e88-3674c43c286mr5506599eec.10.1792601526326;
        Wed, 21 Oct 2026 09:52:06 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674206d1f1sm8700283eec.28.2026.10.21.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:52:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:51:55 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev,
        Piotr
 =?ISO-8859-1?Q?Kr=F3l?= <piotr.krol@3mdeb.com>,
        Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>
Subject: Re: [PATCH v2 07/15] efi/libstub: Add generic arch callbacks for
 DRTM
Message-ID: <20261021095155.00003fc2@oss.qualcomm.com>
In-Reply-To: <7-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
References: <0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
	<7-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX5d3pDHpOVoKW
 GxEIsQ8QP6yDo8iEb+AfQbs/OMr3q+xdWyjzjW3DhPXUtJlHatdeUkPoyTiKJbTC1TakDEfKsmr
 HamDynfZJO6pdeLVX7tUCG04ZVMVE+0=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8edb7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8 a=PZHjKiIRVRR-A8qzlogA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: OqgdLH6dPmPKQ0HaCcMHGETaWQi3K6Lx
X-Proofpoint-ORIG-GUID: OqgdLH6dPmPKQ0HaCcMHGETaWQi3K6Lx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX5JLhxacoEwni
 yndcxh/E47v4XuNamA3nYk96D2v78smU7LH4H9yotJoENhxOvWtQ0ZEIx5S9x4G2WSg6kg0YjBP
 xZZ7eZT3qYEfG6mhuNuLCrWy6WtID2iEn3uEBtV5IthFCYdCkea3tnHZBpPGNt3bOA7Yv4YTQL7
 LDrs6DD6FG99I3yD160EOvHnc9oGwzbyaQIqVQRQ2dWv6d1asDilcep0kvqJSKTitPD8XC8GefG
 qqZlyg53j+erwrcuZKT+AJExMKCW4boncpPzGCm4+LpIAOGed6XqUnUDt/CDVTDl9zTsH96y2f3
 uCJhkg1nZyaHyN+KXC9w/dvKb4lgwZQnvdyRogjd/dWKe1oo+TPxjrm8yKz8Qc8Ou8cv+laHzYM
 eTRKgmsCY8r9RK4pXngGZC2w5luKbtiFLWy8+Ckrj5qLUC5J3RFKpILuETQA3qBOpqvuLicAjLY
 dMLDBiwp+S4pGFOfGKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210067

On Fri,  2 Oct 2026 20:31:44 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> If the architecture supports an EFI stub launched version of DRTM, it
> can select the kconfig and provide the hooks under its architecture
> build.
> 
> Have the common code parse a drtm=enforce|auto|off kernel command line
> parameter to set the boot behavior. Support commas in the args list since
> there will be more options here down the road.
> 
> efi_drtm_prepare() is called before doing any decompression or image
> relocation. It should figure out if DRTM is supported, policy-permitted,
> and how much memory efi_drtm_get_extra_size() should return.
> 
> The image handling is revised to allocate extra_size at the end of
> the normal image. The architecture can use this to store any
> information needed for the DRTM flow. It is always contiguous with
> Image, which is a requirement of ARM's specification.
> 
> efi_drtm_prepare_launch() is called while still in EFI boot services after
> Image is fully prepared in its final location.
> 
> efi_drtm_launch() is called after exiting boot services and must
> jump into the kernel through the DRTM flow. If it returns, then the
> normal launch is tried (auto mode).
> 
> The extra_size is allocated directly after the Image. Handle the
> trivial zboot flow now, and vmlinux in the following patch.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Seems fine to me.  Some of the functions affected have annoyingly
complex flows already but this isn't obviously making things worse!

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
