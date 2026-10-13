Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DB84F96BF
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892657; cv=none; b=ib46qPWcoPxpjoEb3Vn2QFAbld6vqyPiVLsOmqU7FDZv1NgtMO8lsl9BVaSgISugRHfdAzBpvjM1wb4jLFbXfbtV2+Kr9Q70Y+n7fJDnLoQAL1oUruwAkGx1Cs6rAfx7e5zq516IPUS1Y5d1MG6tT76+W41nx5MId1A45SzJ8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892657; c=relaxed/simple;
	bh=Ubwq4HzMIOAqdWk4/8deqrzN3Z40S1+279VGBFr1eww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+6f9NEyYg39rVZRFAc/O1EAiUF+qX/pZ1o/FYzWWau2Wg00xTvU9o6fnEgvxs8o8VnSqmtzKTgnnjO1aX9KjzmzbGnmy4rDhLIp08bar7EBg0nk2zlzfJr7Ub+2uGLIUMZIkPxEFjLPRwwYpfMNA8chZh5sBL1/CNhV9lnMejw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALZ7XHVG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KR9U/GuC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALZ7XHVG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KR9U/GuC"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D943HG483019
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 11:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tzZokV4UDOIHODHJyTn32egA
	FPE75bJMpUh7wLNQ3Sw=; b=ALZ7XHVGdqgJAdRs3FEVk0H90aYVKF4mPQYBSP2/
	/NOXb4QkHzh/vCS0gefaO2JrwvUhzHtJ7A/LfQ9c5QJqhikU9sGmGAxsTLpd+y7w
	HBZoMEIhzxKVHnnfx+GHnQiJlUttfX4SWhhyiL/m6C/t9ntZlP2g8n4qjDX7GxfP
	SH4eShtmRFqMRG8CzFDh7Ar3DKNZfQZheSHRWWJLWLDaEXDf5PqQXnPUvT/mXfI7
	EWxsa/u6vEo6lmMjq3N+lW5/d2TD9TVJoo5Nk47brUxAphdEG8+i+pBAs1cpAQ+f
	6mtebk9hL3s8gJJUMFtw6h5+uIgQX4oVi3+FhQaap3+cJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hpg8q12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 11:57:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so566448685a.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791892654; x=1792497454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tzZokV4UDOIHODHJyTn32egAFPE75bJMpUh7wLNQ3Sw=;
        b=KR9U/GuCuyay9jb3m5x3m2hCvxvHRJFvp2YCnXmt16ME3ft9c/hQLR0QfmaQil3+NF
         s+mzB2GX2mqmXsZwKuWoGM/+lbvqR3LswZc6DcLnpQ8PLUxjzuESElTACZtwwsq9eZZS
         5Y5sR+j1mkNMpJhJJuz4BBmPp3y2ES3KkuZSM5T/8AsUWV2Fh2KPpxasAFaKrxZJgVep
         NwW73E3ZVLMV+lJwz1isGeHaPLo1MR8LPY+x8AXXSIqHVUbJy/b9Uo9pFYOmEGDov8J2
         o7tW8IM4O9Ox2nb2Tja2b+89Zf9wQjYNSCHdAQOKu0f+Q6Lu4FD5gtJA9wWGTdNvj9pE
         sPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892654; x=1792497454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzZokV4UDOIHODHJyTn32egAFPE75bJMpUh7wLNQ3Sw=;
        b=IMcwvpEw8BXELyPnsrOTeRuck4N37ukhB0SNN3723YmSbiHC3LZJ5BIpPSmzXOX2xz
         BM3IDeFtcxdur4BBwdSpGKFpTFbiGvybgTsdORFcu3/gVaUOkynynSaKCR/PdTnuWXeI
         XHKHYzPDcZkzZoLfiY0LIc4/2yUuBbife1E2yCWg/0cdW19pIKAjCRM/52wf2ImeKGi8
         0vAx2wN/5aVT9pm9m+55xRWhZu6ywJV4Sa8L/WKaCD35i+ii+BTnIt5YDI3ARSezjGsD
         tgrZkZI8nV+8q6oOZYb5PCn+nPNKteA0BP9SCE3j9FMvFYx/pu2M/WAovtrDT8/0Q8R5
         RtfA==
X-Forwarded-Encrypted: i=1; AKwUvBzaituccVqZQ0yzifPsBXCYkfpiKGzon/Kze3F5k9Qv6HvrjK6dKgB2xURKl73vyDENYWvdD7T7qL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/KNXxXbPE7QLfzjUHivFR7l4ljkYrDh/aIxg+Y2wbiXFaWL5j
	DbmUha/aVRTD2OzDeP0RzpwM+Li8IUwm4IZ5jedifixNCkbOQvFVVckIYeJUGxPX2D623SrghUR
	/rrUzaEPiej0ZwBy39Y+ncMssOE3DJt2fc2Xqn9SLJIDOAPRBuRYQCv68bbscB1c=
X-Gm-Gg: AYBFou2k5jGI6i8sbMc1ywDCukibTTFWHj8f34IQT/g5DBUD5GkysPDPvOcHO49C5br
	/URihxA0pXkHlYqq7Ny7P2A7XsMZdm3ip4A3RJRduKox+dcfKAjNf0pPUfbBQbl9Bi9I9mNnx7L
	3EgPS8ECaKdTE3GVAiIDRcUJCSUjGqzWvE1sEL3xTQRuFZWtW9lX+SUWHYWGarTTdZCJMKm2RDZ
	tew8JGWphTq1L7e+Kj+AipG057ESEF2VDVEpRRiDXQWqFqlipbGz4MbVyY1VpXC0lwz3+S+2Jh8
	18edBAyfRReiLf26b7lfs/qaMJ7EIqBDlueh3SzddMviAsD2FLXXUzw0YH0m7HND77HQBMkcaPu
	rVkEQfS9Qd/+qQ6Sucht0J0KBozYiSlLsMlF61CwWFhc7ygdbVwl1BoATsVa2F1K76lcw4usdrH
	yLKyHCgw3s5+LO
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2042571485a.17.1791892654190;
        Tue, 13 Oct 2026 04:57:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a03:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93eb96174d8mr2042566785a.17.1791892653560;
        Tue, 13 Oct 2026 04:57:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9e4c55247sm14672161fa.17.2026.10.13.04.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:32 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:57:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Val Packett <val@packett.cool>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 0/9] drm/panel: add atomic state
Message-ID: <lm7u5tcnccbtbxqeyyqzzvmmhpy2dfhgnyz3giqtt5toejy7pj@7bwixidtqxfz>
References: <20261008-panel-atomic-state-v1-0-b157fddb8de1@oss.qualcomm.com>
 <asyAObcpbFy3OeE2@houat>
 <7pptulwzceqg7xozps5boncgcpd5fpw2pdabcslp4den34ixjn@rzgkoe36itwm>
 <as3sI-N3VeG_pL0U@houat>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as3sI-N3VeG_pL0U@houat>
X-Proofpoint-GUID: cpxWFpN7O-4KH0yqB_8M22oNcEeZ0SYK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NyBTYWx0ZWRfX0sVoz7QDkfcP
 tAwJRv0uSnwJuh4p9GcuHPwNE/+JMLdZeukxloILkxxy1kCG7ZBX1+XTrroBKRB+4mowOjB03nG
 srlMAwQM6yzZ4pzbe4Ie4T/iDr4NamE=
X-Proofpoint-ORIG-GUID: cpxWFpN7O-4KH0yqB_8M22oNcEeZ0SYK
X-Authority-Analysis: v=2.4 cv=Z4Z5j3RA c=1 sm=1 tr=0 ts=6ace1cae cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=iLRE3vLiE8gXMxKRWqAA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NyBTYWx0ZWRfX9+xZzq7KkIi0
 uiE5BcBKvDdEoR8+vydlxZ3P0L62u4kmtB4WvqIeYbq3TzCxU1IkSQpzo88I59mmD0sHgdGS4yK
 84YB/XvZppAygUyXop3tAaXnPkxRkVgfu3ofGPhb/EEPYpx5awkYaW7dpVy21aa8SuWLkHZIImC
 mvIzA8We7mcbv/bp2kpBh195Nsnu7rzRfdjeeIwOli3AOQ6OwM04Nj4CdmCCOSlsHvZMuee2b3A
 tzO77HzCLlq8aJhkk33ooFURbRyEaIvC1eNYpX40iZYlpzgbmNwajgjW+OnTkMGT+UTrMrTEWmI
 cuf5K4ulE9KsmR4aypCzbVY2axYKbw14tXlvbr9+mBpLFcLkVkV7Crc+RBnaWrXbrys3/hlPGpC
 zOHE0xAWjn8QZDfkjz6C8aSUsJO9ZXjnMyMKFYBDdkIwfNMNH/URUi/6uxhT4JdU3/r8UpI4rZ1
 2rj6VXvd2IeaCKyGjJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130047

On Tue, Oct 13, 2026 at 10:37:19AM +0200, Maxime Ripard wrote:
> On Tue, Oct 13, 2026 at 10:51:38AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Oct 12, 2026 at 08:40:33AM +0200, Maxime Ripard wrote:
> > > On Thu, Oct 08, 2026 at 04:14:22PM +0300, Dmitry Baryshkov wrote:
> > > > Panel drivers don't have an atomic state and so they can't handle
> > > > additional data to be stored at the atomic_check time or to be retrieved
> > > > at the enable/disable time. For example, it prevents panel drivers from
> > > > supporting multiple display modes or making DSC being optional in a
> > > > clean way. Drivers like panel-novatek-nt35950, save the connector
> > > > pointer in get_modes() and later dereference
> > > > connector->state->crtc->state from prepare() without holding any locks.
> > > > The panels also have no way to reject the configuration they cann't
> > > > handle, as it doesn't take part in the atomic check.
> > > > 
> > > > The panel already embeds a drm_bridge, and the bridge has an atomic
> > > > state which is property handled. Subclass it to provide atomic state for
> > > > the panels. The callbacks can find the state of the other related
> > > > objects (e.g. CRTC state to get the display mode).
> > > > 
> > > > The atomic state is opt-in. A panel that doesn't implement the state
> > > > callbacks keeps working exactly as before, with the plain bridge state,
> > > > so there is no need to touch the existing drivers. The panels which do
> > > > implement them can only be driven through the embedded bridge, since
> > > > there is no commit to hand over when the host calls drm_panel_prepare()
> > > > and friends directly. Those entry points warn and refuse to handle such
> > > > panels. There are still a dozen of display drivers calling these
> > > > functions, and the panels used with them can not be converted until the
> > > > hosts are switched to the panel bridge.
> > > 
> > > I really don't think we should extend the panel API. All panels are
> > > bridges now, consumers only care about bridges as well, and the bridges
> > > API provides what you want already.
> > > 
> > > Why not simply turn the panel drivers we want into bridges, possibly
> > > with a bunch of specialized helpers to manage a panel state, and call it
> > > a day?
> > 
> > I think that panels provide good abstraction on top of the drm_bridge.
> > For example, bridges don't have orientation, panels do.
> 
> That's easy to add.

What would it mean for the bridge? I was thinking about pulling
orientation from the per-panel code to a generic code path, including
reading and handling it. I'm not sure if it should be done in the
drm_bridge code if we declare drm_panel deprecated.

> > Also panels have followers, while bridges do not.
> 
> Ditto
> 
> > I don't think that either of those APIs make sense for bridge.
> 
> Why not? In a world where we have bridge hotplug for example, it would
> make total sense to me to have bridge followers. I think Luca even had
> that at some point in his series (and still might?).
> 
> > Last, but not least, we have drivers that were not converted to the
> > bridged approach (*).
> 
> I'm not disputing that, but it's a matter of months at this point, Luca
> already did a significant part of it.

Sure.

> > As such I think we should evolve the drm_panel, extending it to
> > support atomic state.
> 
> I still think that drm_panel is on the way out with bridges taking over
> for years now, and we should accept it. Otherwise we'll just end up with
> two concepts with the same purpose which isn't great.

Ack. Let me check if I can get rid of drm_panel_funcs easily, because
then we can start using atomic ops for the panels, while phasing out the
drm_panel abstraction.

-- 
With best wishes
Dmitry
