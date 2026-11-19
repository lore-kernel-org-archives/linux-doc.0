Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117942;
	b=kLJ+2uQ+Q32gUsyBPjwrqzyD6yXOdYcRVrZgEXCsbwGLtzF6WpDTweO6SsHs8iK7JomP
	 bdYWj0Etl14UsdpsJryw9ijcHKTL9OQgu0O44ShTdEScVKY92M04tIeOe2wc1piuu5aKk
	 VJfRbB42pIX0QOUjHEPhttzJi8TP5TKeW23DWqGk7yUnopyMtL0WoeJrbM3FYlKLeMoLv
	 2t8z/lI1nSwQLpFrNSHP9OiEnSQYmIkF3ybB9SySeYRvKZAqgB16qGgNLQjOhYIu7nrfo
	 XEDQu15RJvQvoctz6RhZltFEcxcbsYC8aAiTFhz7B6eAiy6qfIwSJqlcBzUMNQ8KSEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117942;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5FjEiY2j0pqnJYqUO8LQZ01V4lTyJQIMaHfii/c8ujs=;
	b=sKBF/modytgvjOq4BJ+Iyp4HKoHOjPegV7Z+G9kjGj5ORZbtePW+Ey6sTOtAbuxIvgPd
	 X8KbbZvfNbuuNk7IxP7DSmsEZjqJQq2wRfHS0D+h4MafPRZcm8RgyxCyMlJrUrrCnqn3k
	 cGgJ+LO5BjzoSckPTaBUcPkNbAI02febZXA+QSEKMmErA3OQ0SgrL5joZyNMi1ob7S0nq
	 GruCJpmAcLuiWn8afSTGY6OhPOALdFVugKIVRPI4vA3BfOVanlOesVHHRRpDuPkSowwnW
	 DT4Op3WeCSD6wo/snHHPaNqG4TL1K4ltaR3PSM0QktonwgIMvO7MFepnkka6dtfca8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=seanlyon.dev;
	spf=pass smtp.mailfrom=seanlyon.dev;
	dkim=pass header.d=seanlyon.dev header.i=@seanlyon.dev header.a=rsa-sha256 header.s=fm1 header.b=A5NILQNp;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DoEtj5dC;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E9606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 19:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seanlyon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=seanlyon.dev header.i=@seanlyon.dev header.a=rsa-sha256 header.s=fm1 header.b=A5NILQNp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DoEtj5dC
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 31C06EC05B1
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:52:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 19 Nov 2026 14:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seanlyon.dev; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1795117941; x=1795204341; bh=5FjEiY2j0pqnJYqUO8LQZ
	01V4lTyJQIMaHfii/c8ujs=; b=A5NILQNpaqmb25B7qSoLYDA72SEndK4NYDQL5
	tdE0tgYGxMz01qwYcHlr8xwJKS9UBqTbDJlNEvIBo4OmdfhAU6SidpJev8x1FLqB
	1wZA49QqQkVC+NL8WW9TnfEuNAJvGw4B5mnGRrB5+om+YCU8QwjbqHsgl7Jp99l/
	DFvO5n0WVmuc43GRDiw9AebtAAK2vrtgZlm7RZwPjdgcXtJSIoR2ny/b1Wy8AjEe
	o05PtWEl8xxkKocB8iLHSovx+oDHPYMQ0z0vKe6hzq3qBfNsD8+z/jufN2Dp722C
	6++GuWqgHBriRkbdZqjVIo/hfGZhLoEiK/Xgy4DzDr4phAmKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795117941; x=1795204341; bh=5FjEiY2j0pqnJYqUO8LQZ01V4lTyJQIMaHf
	ii/c8ujs=; b=DoEtj5dCosVk6dWQukrqwF9KOM0CatNXHrFz3H3poJSKi1iYoRH
	+07RIAdgSWDzmp1O1S9GtoyggrXCjcu6Of8PGO8GHDu3CaukZ4/TOAmWzrxDWtRV
	SCx62UjIIp4ArChkzOtHSjRwtFV/wX6B+rWsu00YorFfuvS9eUVBTagVmebLYvlB
	qQG9W2xe54V9CUUvWRqz+OZge/2bt7NLDhZtPlyRmEbRaIZVG0Nx0UDLh00N1h9u
	uHJff6S0GqmpgmIHJpClOxV5FMMVXwI3MA4yc38xqOwHvOJgr6wUGfPrTLoakP30
	z6cx1d9ELKtnP1Kvr8//z8nJ1K7VRBOfZNg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=seanlyon.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795117941; d=seanlyon.dev;
	mf=PHNlYW5Ac2Vhbmx5b24uZGV2Pg==;
	rt=PGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:tMmYF8WrSdK3o4XijuBx+545Ou6sltDUhrACcBf8CFcAdSJ
	q+sosBD9idJpmPXnxJnf3go4PNl58eLZjRPKEBBnPAn0AUWs9waMFyUQ4X8O6FkI
	AHSbLE2CjM4d5BTTYmCtAowbebPwZmixFjsYXyET6pHsAwEd1RXPgFJyyKQ48UkK
	SrgI4cciPshOpmgybWTNU07zKa8NiPim7m0maMyrr3TrYdHCYUP4QlfMMe+RPDnt
	juyFzgjz+aa16ilsCRZScDjMYQDXwFqShywAN9aB+3Fm/lgkACsKt0JpVosuzz9u
	pso/4hTfHF+KMjQU3Y9ihE2i6KYKqycUr5Dj5TA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:cAveVNDD+ew5zPUXkJJnNBxyXH3cvf95LA9N2pkyLxA=:cE8Cjx1Ug9f35OqIeaF0tCJO5wwoN3wrfbL7I76s6zE=;
X-ME-Sender: <xms:dFP_ampPNPnB-zKAOo-pOsz7yA74DGhQ77GlnW9RVsMeagQycRTZ5Q>
    <xme:dFP_at97RCAYOKW5ryu0eeYOkznZ4RJZTNinOS7h86XC9DDzmUZOqMwIrzUWE0M0v
    CPLsbYPAyy5lq5ac5CBT0SQc89vEU_7pRufMscCs9NWQNTgLH1ukuUl>
X-ME-Received: <xmr:dFP_aifnfD5YY0UT9sXrz1d7zitNItQnKSfRY7R3urEw9QD6UeAWZB6yRNIUNpkaV2nvL0DiThWVoAweHUfaQ_kUI1M>
X-ME-Proxy-Cause: dmFkZTGau1atO3MrYD3qEN84EWdErHQgOJ0rluMbRKPREXP6FaJXy5yJ0tpk05a5GywC+v
    TRicIgN+4SnX3mHFykaymQi8S/97vjstQNrCruN8pF4hRLJ1xYvRe6szYVPb03vEbSJK7P
    88RFMe7CpYhYgaA2ijv8tRnf4U95UmpqmrTl1NryAxkXCxIcJMn1WnNO1kRf46Dfey/R2G
    PsVB6k2kkKpDIm46sbTOsAWC4jrLaqV/l39TDXRroXb6cDpC6OirZD8K0koX6nVv0xPJ+2
    3yEPhdUhJ3qK3Qn+h3rIYiKfVEKCjnDWBWKLRBCD+HohhxJbfwkyx/uT4S7rXi5QcygylD
    xHRkQInGSc4coFgtqJeyc/JFSdcvjLcnqgrb+j++A5jIWFSLJj/ttZI11t2MWMkpsIdr4o
    1VqBCkb5f4zn/zq86+o096jHZUKjndp9IVsKLwRcknVU5hlCWYBqHdZVU0z98OIELwJnSf
    xg0HMHXaScWkNQBwqS4TkrR4NIlFx3fIbJJ8dgTBDwAdRJrR1uugjLe5twTpob4+mXngYi
    suTAfJ4YYtTvFuUr45+GE47eb8pdGtjaEIo0GpLJPCHVIUBeZBFc9LGq73hrBg99NJLleE
    C43MMc8REd9ja0XYKsBzmM6B1A89vcnvr10s4hUxoti3L7jgL5fqXkljrRDQ
X-ME-Proxy: <xmx:dFP_anKU_0tC5418zfQP4NMexS0wasQ5hAsgelRwhLXmb74OhJQVYQ>
    <xmx:dFP_aigXUb6SMMUvwSxC_HH_NQFXqPYa38e9L--AZdzICtb-CmhZrQ>
    <xmx:dFP_alTQAutq3DNByuLUIIit1nkWmMULdaxOcOa9dDOf6kAuGbc8sA>
    <xmx:dFP_asUHEmjRggO7tYO22MspYeVYkdCSrKEs0kscpOCyVk2xJ6dqrQ>
    <xmx:dVP_akC2VUXLYuAMZ81Ri-bx5qOgxmxebDI2bhZiWcHJkmbCdJ81magw>
Feedback-ID: i07c64b5b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 14:52:20 -0500 (EST)
From: Sean Lyon <sean@seanlyon.dev>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sean Lyon <sean@seanlyon.dev>
Subject: [PATCH] docs: conf.py: register sphinx_rtd_theme as an extension
Date: Thu, 19 Nov 2026 14:51:17 -0500
Message-ID: <20261119195117.32709-1-sean@seanlyon.dev>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sphinx_rtd_theme sidebar has collapsible sections. The theme uses
jQuery to add the toctree-expand buttons that control them.

Sphinx 6 stopped bundling jQuery. Since sphinx_rtd_theme 1.2.0, the
theme's setup() enables the sphinxcontrib-jquery extension to load it,
but setup() does not run when the theme is loaded through
html_theme_path. Without jQuery, the buttons are never added, so sidebar
sections cannot be collapsed.

Register sphinx_rtd_theme as an extension so its setup() runs. The
setup() also registers the theme, so html_theme_path is no longer
needed, and sphinx_rtd_theme 3.0 warns that it is deprecated.

Signed-off-by: Sean Lyon <sean@seanlyon.dev>
---
Note for testers: with Sphinx >= 8.1, some pages (e.g. core-api/) expand
more than one sidebar section. This also happens without this patch. It
comes from documents included in multiple toctrees. Sphinx warns about
these documents, but the warnings are only shown with make V=1 htmldocs.
I'm looking into this separately and plan to send an RFC.

Tested with sphinx_rtd_theme 3.1.0 and sphinx_rtd_dark_mode 1.3.0 on
Sphinx 9.2.0, and on min_requirements.txt with sphinx_rtd_theme 1.3.0.
No new build warnings, and the get_html_theme_path deprecation warning
is gone.

 Documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5ab26ce89daf..ed15bb80ef87 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -385,7 +385,7 @@ if html_theme in ["sphinx_rtd_theme", "sphinx_rtd_dark_mode"]:
     try:
         import sphinx_rtd_theme
 
-        html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
+        extensions.append("sphinx_rtd_theme")
 
         # Add any paths that contain custom static files (such as style sheets) here,
         # relative to this directory. They are copied after the builtin static files,

base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
-- 
2.56.1

