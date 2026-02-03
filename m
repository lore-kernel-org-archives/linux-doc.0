Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CE235A92D
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770154037; cv=none; b=pBA+LSAei5n7r5WpseA9VO7JngBWzOZt2HVB35o2Bs4MSG0ATHmhP+GGY3a6Fz2jtVM+RtOPT4O8PV2r0prFvgvj6Wo3nwEqDVFhu4qkCMvPB1etrAVwCoGTp9LTYpfyqASQNh0tYp6FEqKlfzibTL9d5Wc8r0AArvm8jmm1sUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770154037; c=relaxed/simple;
	bh=zqnprRyZRcGU4YyrflNwRIudKW+IdpfYNqfznl54BDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRSFwKaoNtnZcZ1E2q+U75fy3BLDnAmX7MRL8PIhxz13PURWA/vZDFngTCbr4EPV0Aidqw8TFo2O07mNvRnbRFwq3jSzCEcA4w1jk7kYI4vknzbMefGD76DdXInQ10+gUPC52fTMRKBzOnJ/l+FVlu6BybbG1ruSm6QnYFcs8X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kb73YfIX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PP1A2oEG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kb73YfIX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PP1A2oEG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ili8Z2829155
	for <linux-doc@vger.kernel.org>; Tue, 3 Feb 2026 21:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=; b=Kb73YfIXSmTcR7d4
	RlyaDCniI7YeU7LMIO9bX4/1FnCN05gtV+1lh/rWKPjr6c6OUzuI/xzLCVjs0m5k
	BVtZATrWM9YXMJrXia7vyBObHcatr/A/fuaxqkHEvTpEoXVUBzzfoDEefeoh2h5i
	IGeg02PrcidCJhe7qU5Yg9jZUqQICqwhA0kZA4fjm5jzLMqB/KKILdOY1fwLiuBL
	3dNQYdGvr+1eq1hjkA5sc97Vsk7xialvB/2Z/AcWYKspTSSZXEKgnNY0g1IrftZn
	azWRE+0ywQMyOt8LuWtZHTRCwAzb1foz6f7Me+f8dGOl5/Z374ft2i5YEoM7A04e
	GhJ8Ug==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ndvgt55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 21:27:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b799f7a603so372576eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 13:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770154034; x=1770758834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=;
        b=PP1A2oEGzwflz0L1RweUdFFU70U7Ne4UDBfm2gcD+YxwJ0xYcqlvydzSSNGz4ASdo3
         gJJBAnuf3wHak+6l3LbCh/ef8QnQ7knUablTg7Lh1Levr2J6hhfCYTVcn85aOgilwwxu
         anWxw5PkLkPRSnJg6PFrNO7/oSq66ybtN/e++gNGCkxFfJInL21M+BsXv/Dt7Zf6rIBL
         kTtCX0KbLsNmQvl7vfsR57Wij6AaOxdNeK8MknZs6zbGpo07+yzO6ACRJ0ISbawxtk5Y
         pKCyCvUM01DPG9ZwkXLI2y1h5RNLxaAbCAuK3m6svAhwN36uyoTt4gQjOxy5f3hGZTm8
         TjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770154034; x=1770758834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tz1a6xsKW0DDS5mq5QeO0TOyjfRK1srfv9pCRWVxbLE=;
        b=PIp7kOUGK4niavyMOjP6pzrPAWAhS/nr0IH/32BFXtxN49yKfH+E0g5U/Ax41YD+q3
         fOz81d5WwggLnrexh5aJHw+kTflRtkjwvjleZlsRcvFHa3WsXv5vcSNVdH3GGPjHqc/h
         hZTNU7FtqCHjMIOR2XR7ZlZHxEWbPW2zvgFZFmTJATcWsi1alg5L/nzRX2BySTqUOl1I
         B4a8TWhIY4p2sX9p7FsIC49gvNJlzKZorgh+ZBLIrST0ESSk9VCIIHDeOGE2QGU2d6tS
         z9i+FAcC97ezU2t6WDRBYbdHCz5JyRMul6vrHuMW/SHMGYik+358i5DZP3NXLJsQCAGc
         AkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUMNiaENvDCuDoQA/I8CE1mJxx0T2IcGDcT+00mnAM7d87WkNQHx1GyZRytFm1iqvpMY1fPkqZNo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFW30/hWOOCZN9aRxRpsDvzEXbfJxxoKGoeswlhoKTAeZjmXiS
	txNAcyKCfA7y/DlONODJGgPD/iO2KimaebAa0VevzsngFTkHjjz6cZpRR5g4U10JdIpjGfhxrGh
	Tvd78bqVqV/GFgRhrwonzcxwq1XfsTXWeW16GsAOzRWDoLppjR1cOjLl8Oz62rx4=
X-Gm-Gg: AZuq6aKkYR6z3IAc4jRH9JVoVLgv0wbFRIm17ZmDUxEo2Sbdss6GizoXj6WTUpZHc6b
	Ol6kSQM+Wxbcatbn3641the4/Qzqk1fIyQusurVyHB920pSGW9Wlm+2ctmGdN37LaFNiwjnMwBi
	bOrC2id7+/dDo+dFcs/QkugvwpkfFABY7H2U5aTIO2F0ExWXPYaPknbiaaL818KXmwXdRzPFmaW
	J0CVUkCOv7lpgpF1vVRnZ6cMkhRxwl5ASxEiQe4AYqb0LN4GG1iusNXmQd2f7Q/HEk9DIJD7eT6
	Ndbayokt2BYz6NgERIF9+Yr6SmGjAaQKeXmDLTguy76qgva2ybVX2klZrAQstC3fv/WPhur9iKz
	hH1gkPd7/CX395GcaNmc=
X-Received: by 2002:a05:7301:6094:b0:2b7:5e35:fa9e with SMTP id 5a478bee46e88-2b83287e6e9mr528561eec.3.1770154033830;
        Tue, 03 Feb 2026 13:27:13 -0800 (PST)
X-Received: by 2002:a05:7301:6094:b0:2b7:5e35:fa9e with SMTP id 5a478bee46e88-2b83287e6e9mr528545eec.3.1770154033326;
        Tue, 03 Feb 2026 13:27:13 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832e4cd26sm463464eec.12.2026.02.03.13.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:27:12 -0800 (PST)
Date: Tue, 3 Feb 2026 15:27:10 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: radim.krcmar@oss.qualcomm.com, ajones@ventanamicro.com, alex@ghiti.fr,
        anup@brainfault.org, aou@eecs.berkeley.edu, atish.patra@linux.dev,
        corbet@lwn.net, guoren@kernel.org, kvm-riscv@lists.infradead.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org,
        rkrcmar@ventanamicro.com
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Message-ID: <fazd2fcfuwldtrarm6aw26qa5g6fcieoa35xz3bwchif6qfutw@xuvspa4e533b>
References: <DG4PS6NRRUC1.1FL8WBJVEEM4D@oss.qualcomm.com>
 <20260203142422.99110-1-fangyu.yu@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260203142422.99110-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE3MCBTYWx0ZWRfX6MPUn/lsSzMZ
 pHifiMywzuhuQOCLjzETaNMrrzO54lGlOgomjbOHbL0byYCF6kcXjDDiPC1lY+ASsK85F1Q3rPW
 6P1huHflEe9zvv9h6o1JJf1MsMf7KbnB9KC2IcHPXWJlesYMXUDJ06o+Hcsc3iuNQjzQ5PP6UeW
 4vsSDgNifjYTLRfMqm/bVgQe6t+0ucKYVud4vrFWSK0tSn7nGvGgWBJ9CtDJJ8+dd4+r9xD1RoE
 +KMSx82hbfvji8gnlPDIt7sUVOL0st06bYbGnkelBwCrFEEOiIecGlqVG17Ow3NAG8bwCQRG6QZ
 ENN5yGv4KFOpwPJi4oCtHHDiq19p2cFfz4G47JtNF/qevRbONezFJNM09O93coFM2OoXKq7Ad19
 YZXBDjQOS36dCeXMKWY4EsrsCYz/LprcSUN/iR9vvTqzmBtV/j2JPToQ+6Vv2oWYjyfv68kLojs
 0W6FmiJpGO6b5sYzKCQ==
X-Proofpoint-ORIG-GUID: oahCIOA0YLGLpdLRPE2vlSEfxqnFBpFr
X-Proofpoint-GUID: oahCIOA0YLGLpdLRPE2vlSEfxqnFBpFr
X-Authority-Analysis: v=2.4 cv=b+W/I9Gx c=1 sm=1 tr=0 ts=69826832 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=Y6f1DytA9gW5mLcrTH8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_06,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030170

On Tue, Feb 03, 2026 at 10:24:22PM +0800, fangyu.yu@linux.alibaba.com wrote:
> >> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >>
> >> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> >> supported by the host and record them in a bitmask. Keep tracking the
> >> maximum supported G-stage page table level for existing internal users.
> >>
> >> Also provide lightweight helpers to retrieve the supported-mode bitmask
> >> and validate a requested HGATP.MODE against it.
> >>
> >> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> ---
> >> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> >> @@ -75,4 +76,40 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
> >> +enum kvm_riscv_hgatp_mode_bit {
> >> +	HGATP_MODE_SV39X4_BIT = 0,
> >> +	HGATP_MODE_SV48X4_BIT = 1,
> >> +	HGATP_MODE_SV57X4_BIT = 2,
> >
> >I think it's a bit awkward to pass 9 when selecting the hgatp mode, but
> >then look for bit 0 when detecting it...
> >Why not to use the RVI defined values for this UABI as well?
> >
> >There are only 16 possible hgatp.mode values, so we're fine storing them
> >in a bitmap even on RV32.
> 
> I think this is a good point.
> 
> Using logical bits 0/1/2 is indeed less intuitive than testing
> BIT(HGATP_MODE_SV39X4) when userspace passes the architectural HGATP.MODE
> encoding.
> 
> However, if we use “HGATP.MODE encoding as bit index”, we need to export
> those encodings to userspace. Today HGATP_MODE_* are not part of the
> UAPI, so userspace would need to hardcode magic numbers.
> 
> So if we go with this approach, I’ll add UAPI definitions for the HGATP
> mode encodings (e.g. #define KVM_RISCV_HGATP_MODE_SV39X4_BIT  8, etc.) and
> then define the returned bitmask as BIT(mode).

The best part of Radim's suggestion is that there is no need to add the
bits to UAPI. We can write in the documentation for the capability that
the mode values match the spec. kvm userspace can then just look at the
spec to determine those values and create its own defines (which QEMU,
for example, has certainly already done).

Thanks,
drew
