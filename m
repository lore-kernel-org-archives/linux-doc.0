Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3063FFAD6
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464072; cv=pass; b=tckdimU4Mf7DA5tXqQe6lg7bvvM8Qh2ufPnMFuTthHIPY2LvguTSV5uvIua9eoiXU4jSGdcOOGTwZP+uylwCkV+Zv/eSPPBDE5/puOvuXcWAjJo/hW1CYl70Ovv3Efc8w2Fu2HTOpzZuBateTnpk5g7wIHg4nEJxiBrKwHdcXLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464072; c=relaxed/simple;
	bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2OkoG36vGKT4GISGyIoq0TEgTEd3iFLTPz/G2SOqR9spbK/4dzZQ7TrOJOppWdCQm7ef1j+sa/FyUyzIsHPpG2R62BoxHPQbG8DrAoYqoB+tvR3kwcWkGjW1INQGP9JaE9sHWsE2fO4HjEEmx7EZIxHKI7WirVLPiN0xga0x5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yngvason.is; spf=pass smtp.mailfrom=yngvason.is; dkim=pass (1024-bit key) header.d=yngvason.is header.i=@yngvason.is header.b=LZ26vLXd; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yngvason.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yngvason.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yngvason.is header.i=@yngvason.is header.b="LZ26vLXd"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c9ebd1369so3886481d50.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 07:07:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772464070; cv=none;
        d=google.com; s=arc-20240605;
        b=ZAKDGZTacwtMDdvBBNmLfw5YdsW9/QR1f2S3cU9BJAgUO+LsJR4yq/o5J2hnmHd4J/
         yBoNHUUNS76/j8efNo/TEX8NfoKwQFd6pEgE6Dv6QtmzdHkUOXiXqYKPrm+OI0s+zFZ9
         aK5tmp+UbpeLkjGOQMdE/oEea0pl44Amyx0jKjn8bScinTQxVLmgemTc9yQgOltva+zD
         SBKkGeDuJr0tQtv4NJ7j1eeipbTNsrIV15gB6RBgOPe5F6mqHEBtTC3j/FRU1w4LMGvK
         Ja/SaAAT75m7HSZo6wBJYJAM/j+ewtB0++SCP91hkcOnUJWv1d/zDN4Tfi5r0Hn5ip6i
         W/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
        fh=7Ob7OPSX/uXcFUoaf8d1uad2BOkMZoVhOjnUo3h0P1c=;
        b=eV0ptqn+LDJuJjF4/GRpUFL96yJ81oFJeP0eLrV0Y2kmHa817JErDPRJEwz43NOxzm
         vC/ubFbeZeyuj5UL6OWUQglr55oLzUms2T4BVbHuemj5p+vnSYrim5YO/Lm+SMy3k4hK
         OGRtsB+f6bERN3s4l2ai1GZdRWod+i0oIN0w427b6+GPvfyD+5ssSqUn5zkafXDVZWAq
         0Fy1Juh/+NKaa6giv2TiOYpZ/jRxzyrYAjdz+IxqKINUmdpJSVfa0zC34FFGKBPbhxWS
         WuacftecqmnThRSXXf0kzOGj/4l8cNc3AqzZx5bWmVnDt81dE/jzCepKy+Nazm0SJoAP
         oJkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yngvason.is; s=google; t=1772464070; x=1773068870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
        b=LZ26vLXd4ulkzk4SpgBOlVtfCVVgAIuJ2oP+L3CwhUxPCNoPmp0gahdNNSwB7dsTEn
         RvkQgxjjj7kRwE7dXUdKmeuM11sQrZZycEI/+YU6vZ2kSicRZNq1mIKu7TXOWLBqDsl0
         q1stf0Bn7Fs265aO6Rjd5N7NnD0QNJQlelaNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464070; x=1773068870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+gDTORrI2pQyWVeOn4meK1oMBrguCe1b/ScMwN2EmY8=;
        b=QCGCRWXOnE92ybsU2UtdYWBxOwlNjCpqCr/MyVhf/fAN4s2/Bs7/yi8HjFYlieEdIG
         UEACLD8pm561k3XXomkJc076wHPcvscozsLRWh79zaE9YD+T/qqo3GspevZLv27AYF/J
         uhJp7vGtEW2dsB4BJNLfcqSAfLKcxLPNMa11mQHq4UP1WFqe/9vYBatWV7ab5IlmceIn
         tR1RL2zBsw8SC5elzIINCVzwws3JJehWbDEK9q7w105+wjjeQuh6MuXxkfh2kYaYbSCy
         0vtsUdNXAV6LgMfI3DTX2PsBQYavJp+h03mQLc2l7nv3nLDZXlC6Fy2mKs4cMt3konbL
         hGug==
X-Forwarded-Encrypted: i=1; AJvYcCVpo9x+IOLv4FT1XnXDcYvjmJmmehItgKeJaq8EuqjkA9BCvqLcLj+dWYAxUfNuYVc4bnFYRZiaYbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/Ep3qSwZRBVI/hjyGLPsy9YkqnC2RpwEI4PrtQVx3nMrvdnc
	QAPhi4Mr17HjUfWrMvG6QCq+lfmvktgPvGLMXACZpzO0+EIcWZ0/lqBrlnUi4OOfV7GkoKIijeh
	EuWWXckKJYi/LyorlPhaXs2T8v5tkH7klUCSfi7Nh1A==
X-Gm-Gg: ATEYQzz52wtJ4RFhy2fIHgrb63tR9ujw4eHB72RT48T42jmcQfsiCZzuEP3Ok+0AxNO
	Chm4AZONJWvZGcxx7grSKR1g+EvDfx9zM8MXSfdCU/U9PdGU5vLvL5zgBP/KUqF4/I8pOxXj4b8
	Vgb30ktRoxo1zX5w4u4d1rSpau0+Wn12Vs6mwqTCQA2oTqhWX66p/9Rn7hgpNAhcS4X0nBpq3qo
	sMwVKSsVb7+6nFJjtEKAZH1aDhG1NA79H/9j/wqyW5vOz9NLzOW8FS/XeHYLqszxVzvylTMHORQ
	9UbKwElg6EliOT4m2OwtYTLIeXOgm2oz/m7Q4Pk=
X-Received: by 2002:a53:ab0a:0:b0:64c:c1b6:714c with SMTP id
 956f58d0204a3-64cc2379297mr8671268d50.70.1772464069335; Mon, 02 Mar 2026
 07:07:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
 <20260227-color-format-v9-2-658c3b9db7ef@collabora.com> <y5ybjitphwydvtcjdtrmpcx7t7hwevjszpktcnmyvjqkgzinmu@hoitkl7lghxh>
 <5081457.31r3eYUQgx@workhorse>
In-Reply-To: <5081457.31r3eYUQgx@workhorse>
From: Andri Yngvason <andri@yngvason.is>
Date: Mon, 2 Mar 2026 15:07:12 +0000
X-Gm-Features: AaiRm531VbuvPlDMvL8ehAEpeh4QP_0yXJbIL2OEHZWnP0es8QNn2W0TYwz5fEU
Message-ID: <CAFNQBQymuv0roy_xupcgU1bHygfBeE3S1FepQYxpobLq8O0yEA@mail.gmail.com>
Subject: Re: [PATCH v9 02/19] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Werner Sembach <wse@tuxedocomputers.com>, Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for carrying this forward.

m=C3=A1n., 2. mar. 2026 kl. 12:36 skrifa=C3=B0i Nicolas Frattaroli
<nicolas.frattaroli@collabora.com>:
>
> On Sunday, 1 March 2026 17:47:48 Central European Standard Time Dmitry Ba=
ryshkov wrote:
> > On Fri, Feb 27, 2026 at 08:20:07PM +0100, Nicolas Frattaroli wrote:
> > > From: Andri Yngvason <andri@yngvason.is>

N.b. this patch was originally from Werner Sembach, but it has grown
considerably since either of us touched it, so I think that
Co-developed-by tags would be more appropriate here.

Best regards,
Andri
