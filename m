Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395383C6615
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752267; cv=none; b=uNIN2L/d1GDr25Zmwl3Ncrzl3+j3WuAW7jWsSn/amu0HTJPbyB2aKPi67PxCmGZgfdEdyZDiQ7UJ7n4Yc4zTBZBQEodUrxJQF4oQ89vYea2wsANAY+zHpps6+jUEOiK0/ANVm4LJdfy6+LI+1385VZ+OaTOfKSEtQ5BYeySyfls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752267; c=relaxed/simple;
	bh=/oTeYXwjrQQ/M5nRTF+O8D7/sA6vHKbvNjYcLhgGZ0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmbPMcvVD4jVqAJ4r9bVZZvhF7INNkARPn4jH4QYbcn8Gf/FWyAEm+ApeIGm6KlPgjCpPFXHUbflDCBn0LDqp0Op7Gmj/gkX7Czr6SJlHBsXJT2cYXBME3s0L77dRODObJJN39ywzb49Hwd5AF9vXW/tbJnJzWbGjovIY2+GfiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8o04HTA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e89gakZb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8o04HTA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e89gakZb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8siwG2314590
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=thnf8yKaw/E+GLdoSsnuXZU/
	c5PUkd0G5cs1DXiHAEs=; b=N8o04HTA5Y2pMCYTioA+sAUucvoWbc2JD8fQ8AD0
	7oOStFKOxhDCqZzmxWyizEL2ZepokC+P5bo4+RCcr3wxyCWflPggWnlyWa4Rwqsx
	pbE+k1qLhCDzbn9n+E4lmfCkR0rPXDJR0DEhdaxFWRVxkycLzy3uZz2izTVt3QDZ
	wl/Wnq0QRVNDn7XovgH5j6vlTg5f2aynfOZPfkP3NGZy8Oy5qNUMv9vkgTeHVGst
	IMbF83gakY/eo+ssfeo9VvrpKX2ovJBt4UvWL7xqiDIJoBsnyohPS4LrL19HYDRJ
	SqubNgXamAJnf4ArCbQ2PzoFCIS8pqwEVD/nlBB3IISxQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2bwp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 12:57:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd849cd562so3665489185a.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 05:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773752264; x=1774357064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thnf8yKaw/E+GLdoSsnuXZU/c5PUkd0G5cs1DXiHAEs=;
        b=e89gakZbuBH4zXD4CouvenN+xFmeLpR6nnaowvsa7X+/MpOmNSzHHu+h5pGmMsblGV
         EHnPaAiwB85eYsY86fEv3oF2YUNUfLn75/d/NvQlBNL/IRqqA/9zRdBNKCdwBMCOn7Kq
         l+7NdCiIhOa6cKDDZIX7uHyaW8CrLF+C0ChRo45LhwxFYWmEH/4CK8faoRBfuX5PwVeQ
         +7hJcx/Nus3A1fScTKeHIOsGcQ+4hJR3PwMEgunjvRNg9jQdY+lVsCIcpMwt9PjEAeKj
         3v1FVbK3wURYUKFxV2qtCTh1uaBwpD2mBwqUsHe9uoctRwiNgqK+UWom7C9P30RgRTBs
         ZzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752264; x=1774357064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thnf8yKaw/E+GLdoSsnuXZU/c5PUkd0G5cs1DXiHAEs=;
        b=GtOTUaUBJb6D0JKUj6y1CnUJpkhdeQAP5//69pv8k3noIEzZEXSWd8JWkXoxH1Ab63
         POA9B87R5oUpjbkVQdgXckdv+sTBfgOUmo9Jz4h15iCR+37blX7z+7Z7CTk2j5wGVEwr
         woZ6I9E0KwX5yBWypC8/ww1KNeUwGQsMUOgcYDGSKUvLso13MGjLf+75JkxTsk1l1fU5
         j4IvE/h2efhVPXPfYwb2p4cEiDm4onzwmmExQb6mWriI8sYvd4FtkKbzWeWji+klf2Vf
         DxF2t6fe5V8avPdunqbodPNx+OFlH0mV7wEWnIz1A5m/pHxXnaO3RPArvF6z6QhaJEH2
         9dog==
X-Forwarded-Encrypted: i=1; AJvYcCWK6hXjqaUPyqJaXdusCkDIC4ONKon6h45U58+j4tHSZfhxx0JckBOvkaSu4ZJc/+6yWQF2aXT/KKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWYRXEmiBI1dyGGIMS8RxtxiWUOGKTf3Ioij+ty3JPWlgZTJH
	9kyHc0iOc+9JsWBll/ErkQzWCNAkjqmyBRthrN1rSqb0EqfoXlStom9mJyqOkKQDducUnZdixAq
	vFHvQXXfF6ayp+V5ofuMlARltWx8hmDHtdq2JokDAxJPOXl6L8p9og6a9L/5BU4g=
X-Gm-Gg: ATEYQzw5XD5iVXlud6Rbbrm7cQYZvLnRdPdUOodvLlaIJdCk5IONH9NTVweQTE6Lf9p
	7o8OFC5wCf9Nu72wNVTE/OUGvHbxfnMpBD5skBfZ2wR4/iNbMtlsd/b+7g0AlYNHP703ggCLS/T
	h29txVb/K7eUSDI1+eoPGP03hKTnFr6HZZj76RAW9SXqGk1/GS2mPKItThQYV5ddZgXIHrn20SO
	bhuemAUKr5Zi3sOYPrFC/bvd0ESFDddNTpe9C+v/BqbFonjBQtFtvRyFvnoJpgAvawF/jQpCli9
	t1qGvlWA3zYIZkJXrf9WKZm1PDOC+VhwxiTlWyXZ3VAzWFoAVcbhryoe5kpR+Zt2ml/FL2jnCXH
	RfM8t25NvAh9Ajh7UuzRPEuHZJLMNg5byDw==
X-Received: by 2002:a05:620a:4489:b0:8cd:94a5:2f1f with SMTP id af79cd13be357-8cdb5baf610mr2047758385a.60.1773752264192;
        Tue, 17 Mar 2026 05:57:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4489:b0:8cd:94a5:2f1f with SMTP id af79cd13be357-8cdb5baf610mr2047753685a.60.1773752263611;
        Tue, 17 Mar 2026 05:57:43 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea98070sm64174785e9.6.2026.03.17.05.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:57:42 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:57:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ta7l34cyi4esksa6tqy2zsf5ajua4zl3foxjputefuzglbnrvb@bhy6crts4y4o>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
X-Proofpoint-ORIG-GUID: 2jLxlLz9t794prvrkT1vwqbyaV4Gh29I
X-Proofpoint-GUID: 2jLxlLz9t794prvrkT1vwqbyaV4Gh29I
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b94fc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=vTr9H3xdAAAA:8 a=Yq19YlwYyIruqN7yymoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExNCBTYWx0ZWRfXzzms3srghr8j
 ixrmzoMvspF6RaNA8/Jzj5t0VjPG54yHPwoXjyG999VTvL5HC391h8H7ZfeIAy2efixz4/iV+0a
 EJUQq57DlNvG2HfQLb2Sducyj2Vy1zjra+k1Skp+vDVJLZbk1vnzogE2J3kRQUsTIydGH0xF3cR
 0BPhMQvElFHnntlegkY56wi4h3fgPQZMlRvXKE8ypDbsGCOxn3nnJ/H3Dlw5Jmsi/7OiQgFHVAu
 2pVkas/WrDh4EIRrcGJbsXT7sbDSCk1X/ifZRHS9pHK8AFNXtekO1wNFBy4P1iZS7qaUY6Me206
 Pib5juloPnPZ50uOmwqEn75DrRsyKkVpJX6uZTEu+HfVnyCVoq/nvlpPrIIZIZCKc2uHFbOhaJU
 JcujZIiTEvvWnbiGfZv6XEf/2JOcTYpnAfmPpchzhHW3Vss3o20N9S5S9H6ztRNiWBuJNcZlKkB
 HqaUP0Eequ5qwXSsozQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170114

On 26-03-17 13:16:33, Hans de Goede wrote:
> Hi,
> 
> On 17-Mar-26 13:14, Abel Vesa wrote:
> > On 26-03-17 08:30:24, Maxime Ripard wrote:
> >> Hi,
> >>
> >> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> >>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> >>> discussion about how large number of systems need to boot with
> >>> clk_ignore_unused. Per the discussions at the conference, the existing
> >>> behavior in the clk core is broken, and there is a desire to completely
> >>> remove this functionality.
> >>
> >> Broken how?
> >>
> >> clk_ignore_unused is to a point where it's seriously cargo-culted and
> >> documented as a silver bullet, when in reality it's just a debug tool
> >> for broken drivers, and the driver must be fixed.
> >>
> >> But nobody is actually fixing it.
> >>
> >> See
> >> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> >> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> >> fedora wouldn't have to package anything, change anything, etc. But no,
> >> the problem is clk_ignore_unused.
> > 
> > Nope. Don't ever mark clocks as critical unless system crashes without
> > them.
> > 
> > Here is an example or why clocks cannot be marked as critical but need
> > to be kept by the clk_ignore_unused: display driver probes later.
> > If you mark it as critical you just made the clock stay enabled even
> > when display is off.
> > 
> > And this is just one example.
> 
> Interesting, so maybe we need a new way flag to mark clocks as not to
> be turned off when turning unused clocks off, which does not block
> them getting disabled normally later ?
> 
> (I was under the mistaken impression this is what CLK_IS_CRITICAL did)

Nope. Critical means system cannot work without it, so do not gate ever.

There is however the CLK_IGNORE_UNUSED flag, but then we need to figure
out which clocks should have the flag. Which is basically a whack-a-mole
game until we get it right in all scenarios, on all platforms.

I think Stephen at some point said he will drop the clk_ignore_unused
late_initcall entirely, but I guess that didn't happen.
