Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525942;
	b=iVotbAtZy5ypZhHSyDzu7CLp+1iwog9HNGnUuoIf8U5xq3v0FyfBDJH22utPfDmXkh7/
	 6O8zcnu+g8dkwxEB/mpRS6DJVzfr5gdU7CaupNDx3xT1ZY/x5EborW+drQGSGajZ/DMy+
	 LFnWjTWhKLXokGCHev46Pe+RG26YThgZ1RvRobvU5wUsF6hYN+zgMyEHESn85ZNU/zeUO
	 kzzxeWNcQ8WLwTnbV+TbH5z8e6Jtz7WgjCbyiCuvBGlyx6mXX0SBPdCBmiAjONJwSQSSY
	 AANG3f4R3gFdrU4nb441fSFPfAxYx+V5eBk3vI7ldrt2csLRgVo2t47LwyDtJrKPTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
	b=j5+dnt4FBPK0B2ZSG3pjaaMaIJSqS8JpEmhtuQ4J3F9DU28ydrOTNF9Ggcp70rEE4xSV
	 oNQBP9DcRBk+Eml4LdmVLZkQB9y0WGouw1xX24juqN7SoLN6yR7MEKAiYPR/aCUs0wK+p
	 9yVPbIcfwSYqCTq4NDQ+ZQlOj+qtLQ65/rjk4O/JNWWxTV2+xQQw+y8odIStKFv6MkZnQ
	 5YcLxtdynUSuHkjbVpKK9gogHn2m1fbw00LNmPNYed0R9KCpIJJXtALQJbzKUOVoM36i5
	 7PiifBwEo6YTmo51vbkRdNcYpSGCD6ER8ZHo6M1iDWJLSvZnDHhDOc5rzEVPTKqv//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY8j8U2H;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F4C606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 13:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MY8j8U2H
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2630087f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 05:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525940; x=1796130740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
        b=MY8j8U2HvJPRU0JWuC7woMd93fJ8ssW+LisG1zpIkm66fX4ex21BV5d47dfgAD1GSL
         vEVVzgW750eyJCHgD9H9DSqtSMtwP6OUHHWswlmcYhtbq0K00PMTL2HY+/G4YardykdU
         0qyHB2MfCRAf6v+yVn+PpyRRs2JfkQHM2btghQOmjcpcopsFy+H+tBVrJjrEPkJznFKo
         kwptAYCpnK4ZRaUQ/Y+0uAMX1WidLh4SFXwGH6YTvmejxurT3M3hrQ6hOfnomy+m+MVK
         NB3s70RFnU1JQAYVohUeuAoL+Jsmtb4GE9kEGIXD335qTxtjs+nh9EcAZyhiq5gQD81V
         esGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525940; x=1796130740;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SPsNgyVVAqeT7i1RiIgNXc+OMJpYpOzW291/apl/HkE=;
        b=Xwxc7dTQgmwwZpOUugSm+JSXxxcJC2YIaj7zOe5tqWfhyby8k+R3BO8ZZ1p+1tkc2v
         +KwLUH5QlG5KSx0mLbW1w8Cf5GI3d2gi+MjnpZEemkmTG/J7ItbiuFTohSPaBXCxR5Qd
         vFmTXhwf80r9o4k2kJdqSUOpRfJi0fyYD9IUVSZB9868gUqkLwqwcypoy/Joe9WdUQWP
         m37Q/mYe08iP7ExnWAfmr56IsmFIjMaerCV2q9CzLr2bnCocp9AMNI/xU5g/bcGNPAK2
         nt67grV5gOOustpOMY6EyJ+B8T3IaimKooFkKxgf1aEnZ7OQZYgCW7gSpZeiOT1txlxh
         4F9A==
X-Forwarded-Encrypted: i=1; AL+hErHChxkVGReAp5YOIaR75GKJBpKtzIB5Y1r9RRipaMiRTWs7uEUUzYQ+H0wQ9H8wA2f7gSJNkxSY8F0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OIeGr/ST+WASvn7NVJpJJKy8aTPD5YVsGVeVGQkKm8jyFlFQJ
	vgXdbWVX5d3mIbaN9LEG8UubpEUuntwp7Y5fon+XGL8xMIL3gGl/ezKd
X-Gm-Gg: AZFdTZcclZXNBIx8YcgdpPFKFhWuxtHxav3vjW9+WNKOolxDtDgI+2ROQCWV3BBOeXO
	toC4G0GG81IRNnOfDdfI8eaFKDxTKmrMUcJt5UDjxQfVP85JgCWMPPOUj46kLhpr+Qv3cArMMlO
	Y8bAVoTDm+6t8dmFqSw7EzwpXWz+uKFU02r+eOi/QUT8m/ZUtLME8CinPUTH37kp3ZeynQ19JgS
	YD9RE4HCoXApPfKmu1NyG6Fh5uC+TA9qBtJsQHJkMkM12cUyXs4aczxQDwJs/b89Tc0dnFWkLY2
	iEfCHEo39QHxzmnRysc7RJq6qbSCcA/xjwafu92p+nQZYGjlXanY67AM0VSkKD9cITdTEFVXNcX
	YijdX3Y4w0CbUUOIfA+BKUD3Z8GSFntImrQhaeDimjAq4fXJ4fOdMEERnU96EwanejrOEEBrARC
	d1F9EdyqeKIbrldyFjM820D9NB2HhEFMj34zuwMUDbqm2r6EAi/vX2OlygkYniUYxcCRf6Jm9Ef
	75wftNdYpJK1uzZ8Jv52pip115NotrcrSs6q7kAcX4TwWHtuCb4D1srP0IN1NJUBOiIl2BFJSnS
	UvBKGWs7p2EWIHc2klKMKy3A+UEHfEw=
X-Received: by 2002:a5d:5d05:0:b0:491:6c24:65f5 with SMTP id ffacd0b85a97d-4abaf74024cmr30988416f8f.17.1795525940203;
        Tue, 24 Nov 2026 05:12:20 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm29088126f8f.57.2026.11.24.05.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:12:19 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 06/43] drm/tests: Add test cases for DRM rotation name
Date: Tue, 24 Nov 2026 14:12:02 +0100
Message-ID: <awWLyW77VcEKkt1w@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-6-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-6-78ace90f4fc1@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Tested-by: Oarora Etimis <oaroraetimis@gmail.com>
Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
