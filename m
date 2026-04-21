Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21D628C2BF
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776787073; cv=none; b=A+5cjPELtP8GgUGD4RFhl3GEgEjjdRmEvuOjTx3o8HBK4oBBIN9w4n2LrdJAjyFack2nZOILnDnO9RHTGGkFQFE3dqyw4ZEI0BTws/EhSYy8mLYTPMscstyK4iF7QfvjMCREHioWPFj7kcQJT5ByeEl9JAxTPNXmLgtJ0C7aKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776787073; c=relaxed/simple;
	bh=0zVDLT5mWwh1rk+2l66Ze/WnmT4BZ5B/kJxiLwHBLIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLmLn/m7vkRiBNz+a56EfoxER3nSiWBt6BwouIfLcSSp+JxDPGfbTHxwosW9YH/1XYi5maEKHc5cRZ8L2jc+AY8iPEReVgYdnSZrA42l/zRUDTTX38VAcqenbr1jVAZz4eVgfLPBXGfxqeHy+83p7Xa1Bpk+YoXuFWWpPwDJQ8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDFHNou7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2AxnMC7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDFHNou7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2AxnMC7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCsQYs3574133
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=; b=lDFHNou77qSltRFT
	d6mQBV2twhNcfaV3BWEzHvLwNzBM7Kr1tQOtNZtfUAUFioKt1G+wO9ITN72NKDFS
	5UDnm+2ORgJBRVYctxjUSqeXte0QTQI0whKUztK20/S9eDDxSBIKlNzGfG/fTzzZ
	krNDDSq6SqgYvLRhpQAm/le6Ped08gdfIz5V4pBftRdXaXoxVN/KLS6noPl6QxFV
	gnRDH1GOZwh0PUZDpyL5fTxXld3145ylLiprYYjdW/HcbSeUAo6FqsnTbISkgNcV
	Flq5TIjocw4Vyyk0U0euYYEWg4ecfkIQo8O4rKkrzjjubft0Qqaq60D2ufG9NAxB
	IUFJfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465j2b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:57:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso119014311cf.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776787070; x=1777391870; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
        b=f2AxnMC7iUSQBmKIhQ+MEjwdOtPa8Uibfex6Zu/QSPBjAYN9E2Qb+F1TWAV5spOr17
         Jmf2DcfS/TuYdO2jfZOkU5td9/h7FaHtzenf/4yykOXb1C20mHQ27ztgzdibSkdoziA7
         KwD9fUEBOfLmvpcG5NBWmitpgRBg5sE1ufikqfGOUL8FQnQw+2VD10Ff630eBC8IGLeI
         5LwjR1yhmexv+g6X6qLunamWBpG5Iul4oDoWihW/iFVxoJQUOtVXZMM4c6wPwK9nX/3/
         M9h+oJWOCDir9KrS4Ao5GwoXubpOqJQGUlBP0ZvLzo/bZTRsmDONbls/1MM4UcidCcov
         HpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776787070; x=1777391870;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
        b=ZbK0FEIizTDRMT375J7604kSttJ5OF9Oj7cK6//FldjNS1/aEuJvofJ5pst18z1yzw
         328V6Q9XxucL84mdbGU8NKUtuBUng0GpiHX1oX7tMjOxAGffuLDz6yTYRUUcZiRB5IHY
         NSKwAFhD6qNRGUtmQBVUyhU1C4XJ1uJmcZ0xGl1+yLVuWi1Bcg9vGNqOHytLBwfVMZ+d
         jiraxjSVLYbVZPnp+m8itMjGnDJqiS5YOZatGT2Ba/6cA0LWCobn1lyzS6M/dpDDkfg7
         cwGaUC3plJhwjT0fEJZ4UIZKaQhas7l6NHHQkOkltvTbLyjdC3ebygo4bJ92fa1BEF7G
         L0ow==
X-Forwarded-Encrypted: i=1; AFNElJ+dxpXNdMOdvhRrw182DdwNmGbfwEOyxBQLtNwYKKwd/0XGQlTTiL70PAOU+de7P+gozutXA9ukTTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNApJ/rdALWs9UsljzD1Pe9FewtGkoLu9eq3EqAhdN2F0o4fMq
	GKN3FehU0XUeQh6lHi6AFnsBc31Xa+XE0m2j6xXSGujEBtYxuGQV5628Bk3jJPeAQX1+x1Q5TUb
	RNm5We1rH35Tn9+52L9OJBe3VhX9pIfmeytN+EEhigAA+JeylspXeT21/ojiqFTA=
X-Gm-Gg: AeBDietejiO5evBiKooQr9EN2MFepIkFrjXVmkmikC3WKdL1mwXuLx7g+t8jn0TBzqt
	PWXJ8RJ1qDval7rsS/DwUNjzGfdCwv3gsfzq357DV4+jF+YXR8kA+dhDuu2tbljyFe6+iaQtG4m
	NSUR4fEodMvX+6Qt5EETHZy87gADzf7LyyRa4KxTLeayNIQ0L1rGxT72iiMuMF+WlbbBN9BbpaN
	fpL2BmIqBmDbT2ok9huoPD3DBDX4QVXxsn9ozkxmjoUVpmkcaLR85lbHEaX+LQ+6/ZoLrklwVSS
	OOKFztGvYNxK7+ueI+tZYbzPMmyif76iLHvteYx1O6h57SRLXyIHt5nX70R9FMSMs317aNd0Vsv
	q4hk7vNIAM6kLssqDcvEiJhg8hEiJOYQwT4yoR9rtSXX1QCj9hN7YKH/6y/epjXQj1fkl6XmWrH
	jyfSsYxGOG/FA90Lv5A3YTuWq2ysHuYjyvdDQPkNsQnPISUA==
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50e36ca52aemr279020631cf.59.1776787070008;
        Tue, 21 Apr 2026 08:57:50 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50e36ca52aemr279019841cf.59.1776787069503;
        Tue, 21 Apr 2026 08:57:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a5241f6583sm1444371e87.39.2026.04.21.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 08:57:48 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:57:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
        Sebastian Wick <sebastian.wick@redhat.com>,
        Alex Hung <alex.hung@amd.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <rkrhykm7dcttupn3plthf2m5sshtnnojib3f4pj4lxwrswetai@ncxm7oos35zz>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-15-c63f1134e76c@kernel.org>
 <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>
 <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX5wNaoyh98i3Q
 QfKnajS5x1E8ZyaRFbzpi6YnJYglENVHMrE5DxNFOnKrvhaBcbCtkaLMdOKcRhx2DjN10XIqbdc
 XhEPtY1wk8o34h1DsI+v0ZpTs7zSIOiABQoBI9hz0OrfgU6Xe2ePKfPN/W+2KIcdgXIUy9BsQaz
 6QLUOVAEsu0ecsNhIIrYEuFoTD3Es9HOddclM/llhLb3QW90AdEdFSnfPfklxrZe4ID7B0igZUQ
 1b3hgWTkp4opCG2rF7b9wq5grUT2GMSpMX8jEHI3lA3UvlQJe4NGX5+36c/v5Kue/7DMFK0RATz
 yiaR1ycJjpIfhuKEVfNUscP7oDWBWnXPtzkEgylDXURg5NbzHGnKy/Gg+dstdcshHnPZJFBsEOJ
 xkXpHXeP/9FQ20RrZ4HdxWbQrdcvausIsftLfOBrxnX1HlF2CFR7ceVTwr7JHcF1XOp5vTvLvb7
 VBSH8UH8R8OapaWNg7w==
X-Proofpoint-ORIG-GUID: kHEVHrKx5g3fmjp6G0y9lSu7kb8dmO-z
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e79e7f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=YNIvkKx5IWywne6YJjgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: kHEVHrKx5g3fmjp6G0y9lSu7kb8dmO-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157

On Tue, Apr 21, 2026 at 05:33:12PM +0200, Thomas Zimmermann wrote:
> 
> 
> Am 21.04.26 um 15:38 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > > Almost all drivers, and our documented skeleton, call
> > > drm_mode_config_reset() prior to calling drm_dev_register() to
> > > initialize its DRM object states.
> > > 
> > > Now that we have drm_mode_config_create_state() to create that initial
> > > state if it doesn't exist, we can call it directly in
> > > drm_dev_register(). That way, we know that the initial atomic state will
> > > always be allocated without any boilerplate.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >   drivers/gpu/drm/drm_drv.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d98662b5ddbcae8ded
> > > 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev,
> > > unsigned long flags)
> > >         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> > >           ret = drm_modeset_register_all(dev);
> > >           if (ret)
> > >               goto err_unload;
> > > +
> > > +        ret = drm_mode_config_create_state(dev);
> > > +        if (ret)
> > > +            goto err_unload;
> > 
> > Way too late. Lets rather go through drivers and call this where they
> > currently call drm_mode_config_reset() for initialization. This can be a
> > single-patch mass conversion IMHO.
> 
> On a second thought, can't we modify the suspend code and leave the reset
> as-is for now?  I'd still be interested to use reset as a means of
> initializing the hardware or loading state on probe. So keeping the _reset()
> calls in place might be helpful for that.

But isn't it the expected behaviour? The driver can reset(), but if
it didn't, the default would be to create empty working state. In the
end, the drivers also can call this function to create the state, don't
they (and then perform the readout logic)?

> 
> What's the long-term plan here?
> 
> Best regards
> Thomas
> 
> > 
> > Best regards
> > Thomas
> > 
> > >       }
> > >       drm_panic_register(dev);
> > >       drm_client_sysrq_register(dev);
> > >         DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
> > > 
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
> 
> 

-- 
With best wishes
Dmitry
