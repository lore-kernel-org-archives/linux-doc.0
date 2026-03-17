Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C303C6A22
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752588; cv=none; b=nK6/bnqSNdPjUbNe61+MlGpLU79Q67LVrgbu/r+/QSh1NGc1FtTFssokQt+1Ks7B281WECiMpqPgxm33QDASr/Tq/ZeKEZpo5UIhaa+ko7gqxLMlR/I760N9+MZGeWiTM54BCd0JbzbCHx+f+gsbJ6HYKscc+htea0tLfEYZRgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752588; c=relaxed/simple;
	bh=9TrlYkVhdbRnrso2/qxUuCyYFNiDvfawciCWOCjdfTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFkhx0s8LZCn1F0w5SgkIQ/ilyf+D24W01dbJoaLoMyRBSvxZ1TkDNYsBab/4JouRUvjHqLQvj/Dkyroi4wPu+aiqnRIHkB2XxUVgQDaDzalV3BKrUW9z0h2saDe1R3vefmrC7nah2qQXENxp0C8MRdSRfKNstXRBADiiBxh13A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ezLS0iv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7og1iAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ezLS0iv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7og1iAq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8X25o3295207
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=08FCGsj0A8jfUn6QeECb9QwR
	OGThTWUGy2S8O64+Itk=; b=ezLS0iv9z5z7ZgBXxcZCvRLCa+5yadRgvA5PfksO
	GBsF5zB/c37oAOeE7d7+hCplqQx6DwBuLHBeqx0MgOGF6VZCooIPAFze3POvozOd
	+6SgMvY9wxv5VuzpN05P8ifw2VJbZkPfKw7V9v0GkkusWpDt8Tfoe0iDykg5gm/P
	lPVOn+lTU+4BcR5I1N8Cidyikg4q0hP2psh1+KN51c588mRxzxP2SLuLFjnSRaXB
	86k6A4flA+x1JdNf4j4P41bK0x1tvfgvrNNXcQRLjewDoTasA/0ztG8ol4zdL7Oi
	js02Ue99xE88M7o0AkTbqPIdfWouNTFD6qycBu1dm6vUBg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy43k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:03:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60276247301so312429137.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773752585; x=1774357385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=08FCGsj0A8jfUn6QeECb9QwROGThTWUGy2S8O64+Itk=;
        b=L7og1iAqXQccjCOjnSnixP+5pywkaP29ObQJLx3LLUM+Zqc8/HpekB8vSR3zFRhcx1
         Yqo+Pjp7jnYIPjUGXETmA/AATc+gKSZIIvRumfTEcFcgWQTNT4v3JqBD5KGNoQii4Kin
         n9dTXbvnngcr0XBLxkf5WEiM03/wKQ1Enb156T535uOxGpsDbNGqD2eoQiIJMEIG4h4z
         gbGMkFitRlfL/Vre6vZu6NYx+j/GlqECNawB5w/CAzb2nKIZvkiDUx1SwXKYNJkkXRrT
         6PNjRlJPX1PjGeGJKbTXiM5sIgSS9cTSKmBH+XAjQGTCTvqWfxEu77C7LVsKP3ZzOk/E
         8Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773752585; x=1774357385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08FCGsj0A8jfUn6QeECb9QwROGThTWUGy2S8O64+Itk=;
        b=j2O/QecaU2wEq0BP1WDLUtmFK6wA+/K8QYHSlLsgiYMaJ5U9/tqj15jGPLHLmzkQ2V
         fuPflv1FZFARwa3VJZAZ4t9w+dfn8cIsoILEu7Sc89jNmYwHhdwE3+Ellb56984msvWe
         kFKybic/CpOKmSSUBkTpQI/lAoarqBEE8IEIuXkM3LEDYVUDtSRjo5lpf0ZquTiRDeRQ
         svBm9f1pesdZvm5ZWQGG/HZaNveWXRbAP1deqOfbdh8wWE496oVwGJXHp6Mcc6rZWLWC
         CLRAU3TE5L5DD+lt72pNY/FmI1H7bblQFq0IwGHgOUOo3wJfTwl/4HLGPlowEQCIHjZv
         7ekw==
X-Forwarded-Encrypted: i=1; AJvYcCUxKcOjASgpxeq0vjpTeGudXVp2QvHmIC5GBzguQGpKq5K+YWNi46FYIO5lwa4Hbik7AEDKWHn1yYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxb0XDkDsu2fU4ASINrjv86xGwzqXpF7M4FjaWtVDIdCxWAu0/
	EH8GFuvyOEbOQjJeeolGcMzalB9PZ1hXHrnf455cgmhUJuRaA/z0cu9kkEENwUmRbA1mHObGm4i
	5AIHwSuaQhHh//HbYYGQm/zTJInxJlPFiKEyGRVhvem5k5KNonTY7DBuTWm/qkB0=
X-Gm-Gg: ATEYQzzwleOYZi0R+Hae+U+xyEhoTsk9W2Q+pdz6eCta/UOPwUnAv9fn9w6FZPGRWvm
	VzNeL4B7n+8KFQpHy5zas8JH0DtnOEnys7Yqbzedt1+2Z9KKTfw2bwb28HLy93MLswWjqs9HepJ
	AMuZVGxkg9hLFiC7pb1vUohW7ZtueVh3foCsdddUyTV4Sgx2pp5dtHJS4joJ+wCtJ+Wr2mqIoHg
	IIKUIUEBG4L7VmEEctL5wjYn++3HY6IBRZ8K490+8jyAAYGJTkNFFpVDXEkkVDUwgDHUrxAgKn7
	g7wAlSFb65XY7vH77Vsf0LmOR/V0sMAVuWgo78NMBMS629RC8u7bg2NzqlmRdJq2L7GIpRQaJbN
	LPAyj2bqKHGZ/+ooCLBmPB0otOQVWzzK6ag==
X-Received: by 2002:a05:6102:26d1:b0:5ff:c831:b97f with SMTP id ada2fe7eead31-6020e176eb7mr6356425137.1.1773752584664;
        Tue, 17 Mar 2026 06:03:04 -0700 (PDT)
X-Received: by 2002:a05:6102:26d1:b0:5ff:c831:b97f with SMTP id ada2fe7eead31-6020e176eb7mr6356341137.1.1773752584106;
        Tue, 17 Mar 2026 06:03:04 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm28834405f8f.0.2026.03.17.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:03:03 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:03:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Hans de Goede <hansg@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <vhwd56xafb6wml5podszezzi52e6gdnyv25pgwcpw2u262bgnj@x2uqnjbmb7d5>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
 <ablIc4OkoJvdeddT@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ablIc4OkoJvdeddT@redhat.com>
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b95109 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=vTr9H3xdAAAA:8 a=__2JQzxBvQeR38EMPyQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExNSBTYWx0ZWRfX/AQkqCVxMll+
 yKhbyfFlICrHymtj6jjUpCjxbDmc/DI8VdnnUwde2PZAivvuYJ6G1Fl+tbY/6dPbZQOFJA+q2lg
 oOuUv8MJCvZUXKhHiI8ye+MsnEO8UEb4Svybah9gOnIXdPiQmzsK7AHzFE9+YBezhXC5RWwRsO6
 tozS25fv2/xqhPGQfdXhvyIISQKdT5CTOWRDM238+ZalRyUKB7vHolMwR3ZMCHAQ0b5EibHYzQ3
 6DLpdwUKiqeAzkVrR++2uD1msZ0O+jZ2Wo+tvx7Lo96bSkhAsSL6RTQ/sQAabIFjttL6fCv94X8
 HKwyN+zJ06UTg0kHHIWYfuZJeSIhwkR13UZSJmUTZHBPXhomj4iz3PouboBSiFjKlpV/4yXscAl
 hl1cMcg7LKjen5wmsL8YaZHfIoP2UAlSxl0TjAIe/26ctN5neJauaczkrts7egVmFmu81r1DdFD
 hol4ydUHNkxlWwPvSAA==
X-Proofpoint-ORIG-GUID: PMwLYWCULbmMdpKGYs3XAM__nB4gvuJB
X-Proofpoint-GUID: PMwLYWCULbmMdpKGYs3XAM__nB4gvuJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170115

On 26-03-17 08:26:27, Brian Masney wrote:
> Hi Hans,
> 
> On Tue, Mar 17, 2026 at 01:16:33PM +0100, Hans de Goede wrote:
> > On 17-Mar-26 13:14, Abel Vesa wrote:
> > > On 26-03-17 08:30:24, Maxime Ripard wrote:
> > >> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > >>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > >>> discussion about how large number of systems need to boot with
> > >>> clk_ignore_unused. Per the discussions at the conference, the existing
> > >>> behavior in the clk core is broken, and there is a desire to completely
> > >>> remove this functionality.
> > >>
> > >> Broken how?
> > >>
> > >> clk_ignore_unused is to a point where it's seriously cargo-culted and
> > >> documented as a silver bullet, when in reality it's just a debug tool
> > >> for broken drivers, and the driver must be fixed.
> > >>
> > >> But nobody is actually fixing it.
> > >>
> > >> See
> > >> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> > >> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > >> fedora wouldn't have to package anything, change anything, etc. But no,
> > >> the problem is clk_ignore_unused.
> > > 
> > > Nope. Don't ever mark clocks as critical unless system crashes without
> > > them.
> > > 
> > > Here is an example or why clocks cannot be marked as critical but need
> > > to be kept by the clk_ignore_unused: display driver probes later.
> > > If you mark it as critical you just made the clock stay enabled even
> > > when display is off.
> > > 
> > > And this is just one example.
> > 
> > Interesting, so maybe we need a new way flag to mark clocks as not to
> > be turned off when turning unused clocks off, which does not block
> > them getting disabled normally later ?
> > 
> > (I was under the mistaken impression this is what CLK_IS_CRITICAL did)
> 
> There's a separate flag CLK_IGNORE_UNUSED that can be used instead.

But figuring out which clock needs to stay enabled until whatever
consumer module is provided and probes is a mess.

The solution is drop the clk_ignore_unused and rely on the sync_state of
each provider to do the job. Sync state isn't reached until all
providers probes, therefore the clocks stay on until then.

