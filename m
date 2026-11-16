Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847074;
	b=2JrjKeqcSbvQL1q9iGJ17FJ+lOcNUbGHRITM+wapDoBk6rkeh1w2DeP9bPREGfIuIk44
	 vKtEfK4Gnvz3KoX7BFLqs2OpVLms3qKFybA+x3jCwA0MYVjcy0SBk9c8eV2N/p4M3KvB0
	 nXFYaWGqAdBRl384MOt1lQgEGBjbAWN6Ita5hffr6NCqw7PYFgAlY1IUA7nOF6i4Q3gR0
	 CKogQlkE6hf/1XodqiwCaxeKC5Kog13WqVhOWKha0I3K1x2q+fvJU7/QiOvr8Z9AVn+7P
	 D6cYFRXIoK1zVyQti7J0pvdjtrgN8opJ/S17W/bpTJmZbkC0irsw7tJZsRCNFf1SGsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
	b=b9Z4vlLyTQurMsTdInbXL5/EEyJPR87PW2qriwphPFIagh9U7rkw8kGRaD8B/ljL+qtD
	 ems1g27S3sLHeEGSLddp+SseClxAnwHoignjZITK2DMxFRW5JKrGDi7mj5s6DDy2arqHO
	 uSOR1MZKUTyzbJIDkuoie+AOVteWiRzJughaFfGkSkcBnCQ+cgp5oPX23Ma1U2ldnyah9
	 ZCiM4t+VL8GLPXWCqGnXIYZ0wW0ndF2vY6COgyaL37tgDsBkoIbfyF0lafQu+Bf/QbnGF
	 btJjE0RrPbZo2v72vIxebh/HCuANx34f+HX8eMo5M+6B+HHedeKdsTfFObr/vcYRwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3D9606A332
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3D9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so47542f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847072; x=1795451872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=eNqMq4pdG7+RtREnW0nLtbAhfw8loOwD8ch/NLM+mhlO9edO9Xpuh8aJi6/ITtGecp
         SN5fptk7D0/UooZZhSLhlEfkd024Hbrq8zj1AoWJH6DXOsRvSXZ7CpdvuM/cLqVATFcx
         2BKKTLjWXhEvZPkxdUO3iReMBvWvi/3LRR+U5SrooY0v1uRabJ+zptC8o7Gt02M3Egis
         TSW9HwosoAUxvxas8Oqp6Wg+kevVJHOZVQqrkA6N7+U/g6/Js/3IkmN1DGa1UQruVY4H
         cpSmDdTkTw+Qf7cBPBY6VP4Ej5rn9x09uZyaCeQql8eSz30sM/zAD9iliCtW1VhTQCl4
         lghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847072; x=1795451872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=dw2BQIi9KU7wfowEdz8o/4jqwpldZtm7GtCK57a7Sq3muTLbZLfwybzgIaHPKeTsfM
         z/WWVYHTNubTJDkftculZseJ3bO5he1EGoQeK7rZS+QbkL8O3lmnm3ciJMIsoe+HMeEY
         7CAWbREPv5Knj3FbpkdSCqjD4tXKCJPEg68+GS40V2HRfc+3MET3AIRnAGatCmsTmhrY
         cRP7YnxYSQCnCLgyqz/uVS12kNXtTGGVxiF5E2g7t9Tcrid35cdhNusqgTcPFZncFpHd
         RUCQGBHCtl/dcJmbPEbM+kTDHaawrF5hdZfVMOLts8d96tXiTV04+os5lMzCyLhgxrE7
         4cMw==
X-Forwarded-Encrypted: i=1; AL+hErGqsWwNba/kFmj81IEIYpato2KgRRZmOMmOnryUTgBd/FHXk862hIwKmfe2JThtn/HxPs2/u3+UUec=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbbyuI9YFcqOa3Cc3/ddxiPdsfNHJumnEJ7J0mMtUm3jGkrVa
	jtE7hbt2qXu8S+iAAlmCIWAE6ojtfGekpprq3erBqUwaoZaZ3CsQpIr+
X-Gm-Gg: AZFdTZe96Ey44Mq0oqIidXXbGk9z2BYdg8s0u1eW0OAQhgs6vAxjPM5lu++KR5h5vVW
	QDbbrHfF5vCHRzxJrYjFnI2iGjOjLEJzvMREVDzFuJotUkiXXRaDWY3J0o1s1HAWmxp3cjyetgY
	kg77bGU44oIiGl1aS4+IbyVj65dBU2livWikjGEjvoPUJTdCRmvAtdWQfIrr8MIXW//a1Py/mVm
	Q2+xzUq6VIvp+ewReE+zLXg6ShSaFVgniTfYBbgnCiJH6s5VyF7fwtSk/cUoRrC7GxOGJAqWzdZ
	DBwmq41EyGr2HNg6Kj7ju4dkEHqinBNFyw/7qBWIyMDFHvL8W+b05tUJO0d0k4Q7XsDjbF+VKVj
	G0jA1ACMrZyBSwFGthSsLGgunTW403M94odwU0U+rouy6OTjVrpCxphvZsSYOlnbbO3KKAfJVe3
	umcjN03bk61yz3b17jfEK+JdFdo39m1+cp8UvcIUwyqNzeCvVDzuJXVqtK54pEpp5f49Qx5mUPr
	m+WvBeglYSU4qiAzjYJCrvpJmIyKMnP9Hx4qIy1oFTrFDQY89E2EMeugG4XXho3V8OK2RBWBXsT
	V/V6wGQIJGGmDiXLZYZ2f7N7zoDjKHhHtHJyNLSI2ZrRjRrVDirV8J7hNL7Z2f+Scm48hD5PO/l
	WCg+5H1LkKD5HVRav
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr22865762f8f.26.1794847071978;
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm25103969f8f.0.2026.11.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6afb315f.7f974077.2e08bb.6940@mx.google.com>
X-Google-Original-Message-ID: <avsxW86_xeNrm6Dz@Ansuel-XPS.>
Date: Mon, 16 Nov 2026 17:37:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v21 07/15] net: phylink: add capabilities helper
 and track modified advertising
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
 <20261116163412.551438-8-ansuelsmth@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116163412.551438-8-ansuelsmth@gmail.com>

On Mon, Nov 16, 2026 at 05:33:50PM +0100, Christian Marangi wrote:
> In preparation for PCS release/late attach, it's needed to introduce an
> helper to calculate the capabilities after a PCS is removed/added and it's
> needed to track the advertising in link_config changed by the user compared
> to the originally one calculated in phylink_create().
> 
> To archieve this, introduce dedicated advertising variables in phylink
> struct and update it when the new phylink_update_capabilities() is called
> or advertise is updated in link_config.
> 
> In phylink struct the new advertising will contain the full advertising
> bits right after a phylink_validate and the new user_disabled_advertising
> will be the mask of modes that were disabled from an ethtool ksettings
> (with the parsing done in phylink_update_user_disabled_advertising()).
> 
> This double reference is needed to account case when a PCS gets removed and
> attached again to preserve user-defined advertising rules.
> 
> phylink_update_capabilities() will calculate the new supported modes and
> the new capabilities, update the full advertising in phylink and restore
> the user-disabled modes.
> 
> phylink_create() is also updated to init the phylink advertising and
> link_config advertising.
> 
> phylink_update_mac_pause_capabilities() is updated to use the new
> phylink_update_capabilities() to account for user-disabled advertising
> modes and update the full advertising in phylink.
> 
> phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
> account for the user-disabled modes, first in the
> phylink_sfp_interface_preference loop and then on updating the link_config
> advertising.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This is a leftover from the title rename... Please ignore.

-- 
	Ansuel
