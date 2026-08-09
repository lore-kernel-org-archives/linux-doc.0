Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2A13D7D94
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786309184; cv=none; b=B6J2cs/vJDi2bjfTN+ObDvHr3KN+bGGoINhLLK0jKJSvv9W7pfR1pLLBvdIM1a3qVv+NfhHXMZNvTs3Zz0ZZwTg+jiWl+YN4TcwXjNnhQgw3ou8rb1aoSkagHmlcrKa/VamaCJOjQ+5Wd1ArPcU7rQadCD7h52UjYtugdCEP0xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786309184; c=relaxed/simple;
	bh=yP48NfBQNo4R0PchtDbozjKoJ2iHh4aYKSNN83OczTE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtVPZ7nEQvNRgrvBEdBWVCoREhDiYoWKk+yT7CinToAtTS2kxj9pAwEGQ1mGiK/X4/4nVydiXrr1qwn9pT2z/yClHlKJVDqg6KS18Ro2CC6CXqlgO1yQG608sc6rdNp+L8tZnypf79L9M1NSaUib6v3Cb1TFsueaLSHTFe1uZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxNwN1ww; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxNwN1ww"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-480033bdcf4so579001f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786309181; x=1786913981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=KxNwN1wwdMSi+lPudeW+FJ7QhaKt1A+yYoaNtUZaHLTZby9Yk9yLeVqz6I4gJGer5w
         BmDDqAnZPHg/QSd9BY2d0uHN89/rmrIKm3PA+FbUVlFocc7fBsaBnkfutKs7J3eGsnKS
         tRl67spqpd8u5JCywuhHTozcv8vRUlWHg6SUFd3g/WSSd93Q6B4dhCxB8a3t4VblEt8g
         rAZsmUzO+dz6dr0ygidJ69E7TnyHt6/kROsr1BTLiXPVA2B4X48NnpAtDaYTdeQPn3h/
         IthNM21IxIk5r3O64LWpnT4IbL0wuKI6Yyji03Ra7DxHiw1YBTFli2G09GamGDHi5ffK
         0w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786309181; x=1786913981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=SsBFLogg/QVgUAzFJZdFCyyggvgJWDMz5Cq5tyQc/WH70CMyCk9WU6TzOhNtE4Q6wY
         OEP35EtXYOl/GnkXR2thfmsWQ5oUjco8fBtSrCDs6NIb7E+9Z8p2sup7ZfI1run2oikf
         QuGm3sYWVc3S6S5wO9o4LQdHS0raij1ED4v05esCwhUvuU4nNe0r8uBJup9hqX+r/T67
         2Msn461n76ikXQElmiY6CkVKPOPeZmE9tCeL1lm8klkrZlOnJJeAetABO1ykY7TCJQcS
         st1sZJKGVv6QaudfkdITKnVEYuYtAC5YyXXKwVFqxnxc9Ga5wd0AoElME4JAp9xqOyZF
         c3Pw==
X-Forwarded-Encrypted: i=1; AHgh+RqrFeCWKCN+eqo3LwSd0etlR4hVZ6tANftn1FmCW/c/yWLSulzarAOPdm3f4crn3RcNAqWzsGUBguY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzymIO6u/drVZVq3TnEPUlJNcldmMOv/FbMwgdKjEtCQvGb6HIY
	7z/dQ4BubPKlRhSkQtuhClNWuSQG/cSCjAtB2Vq8PrVobwlSh6bfgfkL
X-Gm-Gg: AR+sD13KWKkCKI2GIR59RRosrSg3h+Xu2dFxi2rrHcUmjcAB9VfxJempq0brwyk+aED
	an3NAAEPuaqWNgXKWgBK/vH6xo+seOVDH/CsnXRat6NLPrAloOmM9PxA8P+DnDuFhKk57UoiTMO
	tFvxEw8+cHG2ePOua2uNWtao/u94BXneTyczjrKEbyDxRJMMFUs6JRXgoU4ewD741mSuT2ReA8y
	7ATbiy4a4Q64ZPOQS5/rApI3BKNI7iUNbkRSrnmZ5lKe0HFDiKVWJnuH0MGbyT8RxmH0fA8L04C
	dYaRU0sSRF0LXH2qMQb3yhulKTrloms1CQEt55QKCzEsG7vXzj9G34q3846vEU13DMtm2DKeDv3
	kPlHxJOeD4VAAQnctCPEZVx6OY6p5x3eexGc/KR4OVg2bZzZsw3jfQmudbzYJpraUSbQxwa0t9x
	t+NCZLnma2gXDVa9NFedOYC79n6fPgiyLcQhaP6OEFbF564iDGsX++zASLXEPYw1mChbRCczxLC
	WzmsWwDx3X+m5wem6NqA5o7os0tGn4=
X-Received: by 2002:a05:6000:2006:b0:480:c5:d635 with SMTP id ffacd0b85a97d-48000c5d6d9mr30371840f8f.0.1786309181299;
        Sun, 09 Aug 2026 13:59:41 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220a6d9sm30149581f8f.34.2026.08.09.13.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:59:40 -0700 (PDT)
Message-ID: <6a78ea3c.be490abf.cfd7.7505@mx.google.com>
X-Google-Original-Message-ID: <anjqOJWkUJvo6Wsi@Ansuel-XPS.>
Date: Sun, 9 Aug 2026 22:59:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
 <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
 <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>

On Sun, Aug 09, 2026 at 10:43:27PM +0200, Andrew Lunn wrote:
> > I think the most annoying one will be stmmac with the 3 different PCS
> > implementation but we already handled that in a upcoming ipq50xx driver
> > currently present in OpenWrt mainline.
> 
> stmmac is always annoying :-(
> 
> If this can make it more uniform, make internal and external PCS look
> the same, that would be great.
> 
>

I posted v12 that should smooth stuff even more. I think I found a good way
with the notifier approach.
 
> > @@ -6808,7 +6792,10 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
> >         };
> >         struct phylink_pcs *pcs;
> > 
> > -       pcs = mvpp2_select_pcs(&port->phylink_config, port->phy_interface);
> > +       if (mvpp2_is_xlg(port->phy_interface))
> > +               pcs = &port->pcs_xlg;
> > +       else
> > +               pcs = &port->pcs_gmac;
> 
> I thought the point of new API was that phylink picked the PCS. Why
> this if? Why not register both and let phylink pick?
> 

Yep I'm not sure of this... If they expose different interface mode then
both can be provided at the same time. I think it was done to reduce the
logic difference and patch delta to the minimum.

> > +static int mvpp2_port_fill_pcs(struct phylink_config *config,
> > +                              struct phylink_pcs **available_pcs,
> > +                              unsigned int num_possible_pcs)
> > +{
> > +       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
> > +
> > +       available_pcs[0] = &port->pcs_gmac;
> > +
> > +       if (mvpp2_port_supports_xlg(port)) {
> > +               if (num_possible_pcs < 2)
> > +                       return -EINVAL;
> 
> This seems like defensive programming. If we said there was two, we
> should assume available_pcs has room for two. I would not even pass
> int num_possible_pcs as a parameter.
> 

Yes the if is redundant. The phylink core code ALWAYS allocate based on the
phylink_config value. The num_possible is just as a validation value of
what the space allocated in available_pcs.

If everyone is ok I can change and include this in the series.

-- 
	Ansuel
