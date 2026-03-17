Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356033CB2E6
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753751; cv=none; b=Rx6Qd3coT+g2rLvwaDvleRRhHBIHba+XBPtl1CHgjxeBya9vUtxII6i4c8ICUbXI5RjfN2PtuvdHkSwj8FRWHZdhWxIMY018FgmRlEaCs+vU/lhfL2TTzPzK5XYgofBgslUwltPtAl9XaHKFy0bm03FhxFjmBtumKtF8LcVcJ5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753751; c=relaxed/simple;
	bh=Y+gHycq1uDtvarall5Kj2IetDZ6+CbJr0rQBfvzCu+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzdXs8ul/BVKooGUZEa5HH5b2ku0WOqAmNSmpn5+RPa2BRHAeFM9hGng6/twGAbyCnoVexw7obU8p7TY9gxgMCPky9n5BoWovc/ETB5GgC5he9/pUambkNEeTsRDROUq61xwcuudKvrkCgkk0TII4SxpJumQYDjcYB16Sv1cc98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUOaBiqK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7gdyO9C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUOaBiqK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7gdyO9C"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H89IAk3295188
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m0PnETROFUs0QtAuFNpwkD6g
	jxN0P2pWcnCvRiA0zdc=; b=cUOaBiqKh7pjJRrMmEtxky6Sll0P/4Sh8TM5NA+M
	omG2XBoOt4OxOZQao0jcGPkxciirZZ4PFIXSf6G0gLw/HbKca0VSgKbgZkNlP53W
	D0XHorQVWlf+gDbe30JZ3Njk4gG53TTVC67hSgsnkbufc+nzrXJdbdEMpkPWFdqz
	vj4ZT7FuNE4kAvmEL2hMcusoxJUdipBl/Sp9LCOlb8nSUE/4w32veYjL2T/XM618
	dAiPf/afZiXvtzNEFak+MkoufNDB7ZRkfl4lc6crKOEgvy0UNuf5NTeNMPXlnzKD
	S2BkGrTILZonyEeKmt93zXUDF69Y85SSXiw/xLYs9k5hbQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy45tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 13:22:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd80c4965aso528549685a.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 06:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773753748; x=1774358548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0PnETROFUs0QtAuFNpwkD6gjxN0P2pWcnCvRiA0zdc=;
        b=A7gdyO9CqyFF4FoddJ00P3/+JkfZPB1qGol4XmRY1PaOk+MCVsm/S+o/n50WwTwUGB
         jcKhkaIdG3blKNMvx5dTxfn4vr3nA19LuBk0U5198JznLumNuqQ1BGxBM5y7xJOkAn3J
         Z80aVbmUselU7ZBbIHoMMIqcLwjM0ZV6dLr8bmEJDwkJsM4Sn6K8vVJoFFyhT9MqSNEK
         IcISKNcqW/tddX4yFdl6F0e46qulB6FrwUFkwaOMe4mToI1LcGncy7j82Cffd/lQnnT+
         4zmtOYjmef1CL/J1+6b0q3lk6QRCX57jE7zsWqodTkWub7hTTpZGnGIMCpYAV4ey6zBn
         t9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753748; x=1774358548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0PnETROFUs0QtAuFNpwkD6gjxN0P2pWcnCvRiA0zdc=;
        b=HfnaksqMHPkJ0jzZRfUNbSTbKbB+H+h9UMgZGTmCxYK6gvaaSjkWyCQBYm9ngzA5yR
         /bIXj3+v/WdvtKHmGk6yEbdZzSbSTdqir6XEe4DFILJqklrdfnnWB0vx8Gki8WmDiJ67
         TUF4pK/OFqYo/DmHVtyzHIfuywlGbvP9tjf7DeyIfRUt44ZIdEPPtqkW7huCTRXkF07u
         OunAZ0TPlKkbQ3SNZcv76shamTjCP8NmlRKAzqEhdGjawjpjARQPIIvyT17VHl6ReBHT
         yc8EdiAw0Nz8oZI4Prl3cZP0vd3UwSFh/+a+M4cXhDdrbhweX/lFnYmDGCI0l328naH0
         BUxA==
X-Forwarded-Encrypted: i=1; AJvYcCXN2DXNwFtQbbg0KhsduSCTsRt9C5vr6hpsEVEH/qMP209aAmoA7LsJ5v4gKzjZKFiHHmGqh/SgARk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGzAGS6uj/7OsNaEhAPA6IbNo0TFwFO2+uLnjMK1RKbmQ8zdNV
	CJR/4GPEs0V4MRDQzLMR8kHJugB/CWVWk8dkyA4d3wskLXL2bFHv9rErONuaGB9BaUhTdE5wkTI
	S/8Sgj7ONV9MSkoY+fLbC3DO+wlrnsPBW86UkYuLjapEKf3upVkbgVkWugjz2hFHzxDQP81s=
X-Gm-Gg: ATEYQzzTvG19H0QU71rg+QSWMqn/mP12M2QQQ6vuUUlXTxZpzro+F6rpi2YMDaI876D
	hXY8dh552o3R0OBQ4W+l0JAIROhH0at8XtImAFKmTIoejNlm+PkZpA+YSZO2bkxVwSEJFK4EH38
	k0pfEvieUjITN3Qghnoh2zlhcZjfS565T6qEYQtpvTlFSboY5orQ1JAU7tt6pZkJrGIR/q5sKf2
	FY2ex4rz8YkE8DDTBr5QsThjfL26ptFtlYPV68YFJS+LWoQ98tIVgUF6pLXozmX9FRv+Lnfm/Ce
	fjcB5X7Zf6fOhElA+uA7PLAuH51FH8p6m+qWuGnw5xraDR8FXNIzdvFYDha41lPlW9Ot38ltqbp
	VQ8ROMnSLGOmwUmNy/OCcZNvELdkpsI/dIA==
X-Received: by 2002:a05:620a:28cf:b0:8cd:81cc:5579 with SMTP id af79cd13be357-8cde14e901amr412321985a.23.1773753747681;
        Tue, 17 Mar 2026 06:22:27 -0700 (PDT)
X-Received: by 2002:a05:620a:28cf:b0:8cd:81cc:5579 with SMTP id af79cd13be357-8cde14e901amr412316285a.23.1773753747058;
        Tue, 17 Mar 2026 06:22:27 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm50772702f8f.21.2026.03.17.06.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:22:26 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:22:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>, Hans de Goede <hansg@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <fhuenkq2tk3oeywkkqmejswnwwzwlcvegynkkpqpp5ise2gfb6@q65oxtdtcmpi>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <90efa4a3-7042-4fdd-9108-9234b0ba9573@kernel.org>
 <ablIc4OkoJvdeddT@redhat.com>
 <vhwd56xafb6wml5podszezzi52e6gdnyv25pgwcpw2u262bgnj@x2uqnjbmb7d5>
 <20260317-lush-rooster-of-progress-9be3bb@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-lush-rooster-of-progress-9be3bb@houat>
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b95595 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=vTr9H3xdAAAA:8 a=MuZct8BR0P34GXsGxTsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExOCBTYWx0ZWRfX1ki8FwkZI6jp
 lGxVBkpkAdhjTuWo4seVyP+BS0bbFcDDMfJNt15GAe2PvMuOla7NCjGY5YUqnnEX/rZHc5/jPfj
 c06IVPcGhA7t/jTu7Q0YE0Z568EAEevzUcp9eeLs1T8wheeoWiyWU2w77/CM9Q8BJ/axq7DNeKu
 WhtwxeJO653nGlcmptWL1DnYd5uZFPfHKsbEdWJe8lplN8DXnvMEgAg3L+RM38eMiYeA93QzHcG
 4gaIVkymTA5fqJI0AhF2Bk+WdEAAcIUbNe7EbVjrf5WpUYKlPelbeOilgB2jnom/nMdaWZSQAMf
 yCkqh4Zx2vOOSf0PtVV+Vo82eBQtOEahxn2zauHCIwiFoZi5bScVDkjfuEk4zpr1EUbfj/JPsyn
 DtAtnqybW85VlufrQZD68r6IzO6u9qWCYjv05miodS7Fg1XeGdqeX4pzN0TODT7UvX3jym4FEG6
 lMv4wrwj4YnOzg75uoA==
X-Proofpoint-ORIG-GUID: dSlcgm6iXDids0HugGhqwJvhZUv5jYBZ
X-Proofpoint-GUID: dSlcgm6iXDids0HugGhqwJvhZUv5jYBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170118

On 26-03-17 14:18:56, Maxime Ripard wrote:
> On Tue, Mar 17, 2026 at 03:03:01PM +0200, Abel Vesa wrote:
> > On 26-03-17 08:26:27, Brian Masney wrote:
> > > Hi Hans,
> > > 
> > > On Tue, Mar 17, 2026 at 01:16:33PM +0100, Hans de Goede wrote:
> > > > On 17-Mar-26 13:14, Abel Vesa wrote:
> > > > > On 26-03-17 08:30:24, Maxime Ripard wrote:
> > > > >> On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > > > >>> At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > > > >>> discussion about how large number of systems need to boot with
> > > > >>> clk_ignore_unused. Per the discussions at the conference, the existing
> > > > >>> behavior in the clk core is broken, and there is a desire to completely
> > > > >>> remove this functionality.
> > > > >>
> > > > >> Broken how?
> > > > >>
> > > > >> clk_ignore_unused is to a point where it's seriously cargo-culted and
> > > > >> documented as a silver bullet, when in reality it's just a debug tool
> > > > >> for broken drivers, and the driver must be fixed.
> > > > >>
> > > > >> But nobody is actually fixing it.
> > > > >>
> > > > >> See
> > > > >> https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarch64_EFI_systems#How_To_Test
> > > > >> for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > > > >> fedora wouldn't have to package anything, change anything, etc. But no,
> > > > >> the problem is clk_ignore_unused.
> > > > > 
> > > > > Nope. Don't ever mark clocks as critical unless system crashes without
> > > > > them.
> > > > > 
> > > > > Here is an example or why clocks cannot be marked as critical but need
> > > > > to be kept by the clk_ignore_unused: display driver probes later.
> > > > > If you mark it as critical you just made the clock stay enabled even
> > > > > when display is off.
> > > > > 
> > > > > And this is just one example.
> > > > 
> > > > Interesting, so maybe we need a new way flag to mark clocks as not to
> > > > be turned off when turning unused clocks off, which does not block
> > > > them getting disabled normally later ?
> > > > 
> > > > (I was under the mistaken impression this is what CLK_IS_CRITICAL did)
> > > 
> > > There's a separate flag CLK_IGNORE_UNUSED that can be used instead.
> > 
> > But figuring out which clock needs to stay enabled until whatever
> > consumer module is provided and probes is a mess.
> 
> And yet, plenty of platforms are doing it just fine.
> 
> > The solution is drop the clk_ignore_unused and rely on the sync_state of
> > each provider to do the job. Sync state isn't reached until all
> > providers probes, therefore the clocks stay on until then.
> 
> The problem here isn't that providers have to be there, you said it
> yourself, it's about when consumers will be loaded and get their clock.
> Either way, sync_states don't seem to move forward much when it comes to
> clocks, so it might be something that we converge to eventually, but it
> won't help this patch today.

Sorry, I meant "until all consumers probe". My bad.
