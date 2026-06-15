Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF84E3F411B
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526662; cv=none; b=ApNxtp0U28WH1j/wNBvMjGhyrKtTcKqdMuV9cqP8urkDcZ6v5vBm9dRa9dBGTTc4U/SVicF1vJdrj7HmhrAJYctkkYpD9yamfDgycpq4qMWppihAY4o24mEgccSjCwr0RnccE/meKgxEh+vMc9XSAlpDlw8jeZEVbWxRrTaTGxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526662; c=relaxed/simple;
	bh=s24y9GPV7y+NJAKmvwvAX1cER3c+JYcl/Cz6+DphJa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0Pds4kKMc0KAD6UbyiGoLto/mlp/8dGKeLaC+qmHq2ARUgkddMpcI6PzzdHXYAgJqhFzsSymXxai6wYJbHt0bnikx0/uhomCvTop81+9uF/x2D5I04UmgRlxFQL8Bc1IpyauJDurvqT7U2PIqrOMJJpJvlNiMh6lwCnuWi1gVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLj9FNF9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLj9FNF9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45fe59255beso1707827f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526649; x=1782131449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=RLj9FNF9kCa9JCJgII2lEK20OgFXJIkgwmHHFV/g4ofnX1cRRStGQ4lF0s3KNBCB/d
         P+NJHCYne6EdbHZid8DaxC10V5C1fobEjjlXWPU2u1P8gX++Vb6nl4TivkfTrAClYpdN
         YYYIKmxEa/pHTQ4zf7rX2sr1naB2MNdilGTKIDaqarsZYObQ6dAEFm0CClEKBIwrZKW2
         Uhj069wO8cDjGKJ5xVIXQH2AmsjdY9dCfSTgGlI8/AYvs2ZducVXG5h+CY1x1vOFiy8z
         OYkRTE6shBZyviB2H3t72IS0pea7rvSFLFceXCqP9kb4zgCjpdE5JwHv+78Va8djtRKo
         iFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526649; x=1782131449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=RqqZfP89T026ZHeicy6tyTRgNSZc+TAPaSKLUWTKEDH2COHWpPwW3/mK6hxqJ/yDFF
         U/s2copzrYdcbbJVzXCbq19MdPzTfEF5Uh+/c6/SzPJCFOI8j7tt9yz+c9kN4PCxkpAs
         w1jHGbTlAZWkXL8J7JncaGhlmvz85SZxzR52pNhnWL6sIOxhEkZ6QCwrRnon5aOqObGw
         P3pNWP4wz/P/LgEjrB/IW+cdjgBgToADBilWH4Qyib8eziJSGtDQInxDAxz4GuGfL9un
         gQOrwVVbRv65IcmOaByp18LEa/5VfyEthQyPKtrBoH1CSxfLa3QYbWnZ3Oox9zeBuXtz
         uOiw==
X-Forwarded-Encrypted: i=1; AFNElJ/X/i3peHbhvHCJpqxWk+q24p/wFKzNBqPgksLlDxuxucZdm1+mjb6mnWQvQ7f/a/7nUfZ/21j4aqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYD9csoCeTkAlh+6/ovBIrbMVy75vEK2c07Ui4Neg0FrM4Xq9a
	SW8qpJYEn9ANSV+zF7cWR8YYzcC3DK0Uk37FsrE7kuNEC5fK0apR+TbT
X-Gm-Gg: Acq92OFYrz3T17TaaNhUqd3DlCbZkx1vdorNnSrcQQq6EVPDVKQ4mAbOVjpCaAMwt8J
	QOsfE1tgyn+A3V8L49eNtu2MUD8ZDf0dIYru+Etbd2hxRArsow79k8AgsD17aCVwAPOnaZeVAw8
	FmYMAEd1/99rQqyTy2S/P2AOV7Dw2z5nLVfcVf4OE1vCRDOK7Rc8xnJVC53znLqZ0th+LW95Kj1
	4X2wNx60UmYIv2RAT0HAk3RTXMhZbHdNvaQ70b22fi9lPgtNEHJvZQ6Gx8wAazAxjAbizDUs5vM
	S9WzfXAxAbG9+SlelRL8B7D7uodgjZeWKgu3tsxUkBWK7/t0NNGaCqiqTgfwslOvnNK6SIDWoO4
	3cPrCwG8QDsQUBfW0rU6AzAAaOJN037SCzTaGs4H8RGsFBTCApdIPsJkkpwjMRN5L/8G6qfD+DJ
	HH848Nq3gOrJPX8/2nmt3Kwli1ddpNvorjXMa8L+xqLl0gv8xsqdgJ0j7BJajQOORZ8A==
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr195103365e9.8.1781526648835;
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:48 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Mon, 15 Jun 2026 14:29:44 +0200
Message-ID: <20260615122950.22281-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0

