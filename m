Return-Path: <SRS0=2c8a=CN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA98C433E2
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 14:21:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42B6D206B7
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 14:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbgIDOVr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Sep 2020 10:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730565AbgIDOVf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 10:21:35 -0400
X-Greylist: delayed 1517 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 04 Sep 2020 07:21:33 PDT
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEABC061245
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 07:21:32 -0700 (PDT)
Received: from ip4d14bc8c.dynamic.kabel-deutschland.de ([77.20.188.140] helo=[192.168.66.101]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1kECCB-0000UN-Ox; Fri, 04 Sep 2020 15:56:03 +0200
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: sphinx-pre-install: dvipng not checked by default, python-sphinx
 added always for --no-virtualenv
Autocrypt: addr=linux@leemhuis.info; prefer-encrypt=mutual; keydata=
 mQINBFJ4AQ0BEADCz16x4kl/YGBegAsYXJMjFRi3QOr2YMmcNuu1fdsi3XnM+xMRaukWby47
 JcsZYLDKRHTQ/Lalw9L1HI3NRwK+9ayjg31wFdekgsuPbu4x5RGDIfyNpd378Upa8SUmvHik
 apCnzsxPTEE4Z2KUxBIwTvg+snEjgZ03EIQEi5cKmnlaUynNqv3xaGstx5jMCEnR2X54rH8j
 QPvo2l5/79Po58f6DhxV2RrOrOjQIQcPZ6kUqwLi6EQOi92NS9Uy6jbZcrMqPIRqJZ/tTKIR
 OLWsEjNrc3PMcve+NmORiEgLFclN8kHbPl1tLo4M5jN9xmsa0OZv3M0katqW8kC1hzR7mhz+
 Rv4MgnbkPDDO086HjQBlS6Zzo49fQB2JErs5nZ0mwkqlETu6emhxneAMcc67+ZtTeUj54K2y
 Iu8kk6ghaUAfgMqkdIzeSfhO8eURMhvwzSpsqhUs7pIj4u0TPN8OFAvxE/3adoUwMaB+/plk
 sNe9RsHHPV+7LGADZ6OzOWWftk34QLTVTcz02bGyxLNIkhY+vIJpZWX9UrfGdHSiyYThHCIy
 /dLz95b9EG+1tbCIyNynr9TjIOmtLOk7ssB3kL3XQGgmdQ+rJ3zckJUQapLKP2YfBi+8P1iP
 rKkYtbWk0u/FmCbxcBA31KqXQZoR4cd1PJ1PDCe7/DxeoYMVuwARAQABtCdUaG9yc3RlbiBM
 ZWVtaHVpcyA8bGludXhAbGVlbWh1aXMuaW5mbz6JAj0EEwEKACcFAlJ4A3UCGwMFCQ0oaIAF
 CwkIBwMFFQoJCAsFFgIDAQACHgECF4AACgkQcrbm70xYPS0OOw/+OM+pakOz+MDn9vAgc5Xj
 dVqxjH1+cg7UWkW6UrkniT3i+THv535lGwwB93iQpG0eaLqIPcfFqWGHCJDY4ys8AdCiGA55
 D8eX/A/94Dboz6hzxfu2M4KvpiV2FQrklIZXGiLfr0+ybBUu+PoiS4OA8UzNc/rtAZivb6qm
 T62uUGtmWoj86hDSual9Syi1dn4ff9PVJcGMFk4URkg83qZpVeU/iOnPO7mfhV5l9yfuvP9h
 zhHQOTDrcOm8vJVgcs3TAd8WKke7ueBxuwlDS4a9X0ohT3MycO1sUSx5VpnHsZynvvyITEOW
 njjuBhIJrbjt+c/9HWz+5cJJ7QZOE1KrOAN+u6N4yFZrMFFKKug/s/z9wy7Cg5ANphJ/35to
 nZDV9MCw96sDONEdwEl2u4ZwN5oNJGdFm93odoGSvzu0LNgGi1AWE38pOKmq8EVDYJNMhsv+
 V0oj9vJJso22F5LBJjg233PIdvkF6KwihTiryVZUi3rX1RSwH8HFzVDCETW7bp3EAyUPuoTD
 f8vb7/5RZpNFzy/WtAt80hqp773+PAgPJuXGliI2uJol3nz9PWRhf6yn3U2VSkbiIG3MjwpJ
 vJL/dbiiKWn932U/JV8OKA4m7GKy44ZnTL0nYf/30/5gEVMM8FiPiY1Cybw907WYUxW+dboi
 eu8fdvHIi0xIBWu5Ag0EUngBDQEQAM7v97GrVs5cuvi6ouXUxUvfoSrxTLXUW/71uKPQkLDK
 i9gSRqBOLl78t3Gp3L3MqHc01wlMW3rDT++/Sanh8rO1pBdprS1V9pZ8l0lAZvzjcGrLiuyi
 8/KrrLHlLLL4yTw3cPJkSwFr43LGLGdKoCFOpAW72HJFFpGyY/9JLkApprpUTHGkEa0WK5O2
 XVDo2mJoykflCR5Y8S4Hq3oMol7pUScQqYT+ZooKMoqGtXrHrfIhfX4W/mFmNel9SN057nFQ
 ol4sc8cJ97sIlRoNvJ/r3X2eZWnJAjo+oiuPpX85Xc+DXyFyvvP0dcA/cjo9a69zrIw6jmro
 KDMYBBTosIUA4iZUSlWg235gtRuTdWH0CJ/dM5xGHDO/kqfEXOUVIDecn7sMonInyCUArYlo
 IxfLbXCBLioNE5hm+h0BwLRmgVyslxkLpQ9QpgRyFs4O2xoHuUeuoXW6tQYjF+UHZP6N0q9j
 iwq8VoajHa3iRS826BHNEtdwQsVYJZz6nb+bHe73m9Gs+Sxkus8lU3U27j1LuAtWW7LT27gg
 cEsHtxEab6ZnSMx7SCuBvYhiEd0nqNKFjs0L5BZ/JtpOh9vw3pc/SHBxHn0nubtBoyANfG2R
 Le0dpPAjGfOL6cljnIYMFytgzVwDs6uM8FfFuE4mIhYiFV30o9fObwqbhO49LoKdABEBAAGJ
 AiUEGAEKAA8FAlJ4AQ0CGwwFCQ0oaIAACgkQcrbm70xYPS2OxxAAr8OqW+bEjQV2PLLAHIh6
 fmhajXtSn9bzULofgyD4PsgMsG25di74GbegGyTIwt7cS7Z5ZR5KL7ZkN1GTDFGlWyiZ+6NC
 VsWR62+eujnYvtHsQPaTo8A/uFV+Too4v4ikS4ZD0ondWa1FimLouem9QwOSnyn4yErxUQcU
 yUXHLhUtYs7MO5R4G++Ev+9eK7rRqPeUOqTjQV6Eigi5Ny4536fKMJDNp+YhlRopWBA0fVjf
 tF0MJTV0ShFK1YWLOADJYo9NG+KOeyUqesOvRSxtpQcdcrwPFjkJ3JcknxZstvWid4goqMY7
 l/vGoG7zQDSxUDpXcG9X70yHrmVK/w0dn/PHalfUnOsQpvQYTjGhZ4UnXAVaBsouYLGFo9AL
 lLNERHY4eRR4MEYvk6ABZ1AEaJwiwyZuPRt/iN1EIMM7fnQQcdBYHGJzaV8a3jwHeLAPY1e/
 hS1OsrR9pqGvqQsagYkiZFOCjZxx0IQhokMSIxbFvNfLHTqXXpJzlCv9QGj3s2ZG6o36u42k
 yc+mP1ya8uxIFEwcp6C1h4TTisVFC2DXxDi7pqUd9oTuI4Hg19/i07cdYUHDiraDXSXW5zH9
 5ZDV+rSqDU3ercoRd2qjGUOIXWOytHTeJhVOWqM0vOmXDUwwYHuEb0HFn3d/tz+idSrXUSXZ
 5iv6NKaV29GWHbY=
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Message-ID: <d5d42023-9cbc-614f-d85c-a2a483a8b700@leemhuis.info>
Date:   Fri, 4 Sep 2020 15:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1599229293;e204492b;
X-HE-SMSGID: 1kECCB-0000UN-Ox
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro! I noticed two small oddities with sphinx-pre-install I wanted
to quickly tell your about:

(1) running "./scripts/sphinx-pre-install --no-virtualenv" always tells
me to run "sudo dnf install -y python3-sphinx
", even if it's already installed on the system. On a quick look that
seems to happen due to line 738 (on docs-next), that afaics always does...

> add_package("python-sphinx", 0);

...when running with "--no-virtualenv". Doesn't matter too much, but I
thought I mentioned it while reporting the issue that made me write this
mail:

(2) when running 'make htmldocs' I saw this warning:

> WARNING: dvipng command 'dvipng' cannot be run (needed for math display), check the imgmath_dvipng setting 

I had run "sphinx-pre-install --no-virtualenv" earlier to get everything
I needed, but it had not told me to install dvipng. So it might be wise
to fix this with a patch like the one below. Please let me know if
that's the right approach, that I submit it as proper patch.

Ciao, Thorsten


diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 40fa6923e80a..5515cac027ef 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -379,7 +379,6 @@ sub give_debian_hints()
 				   "fonts-noto-cjk", 2);
 	}

-	check_program("dvipng", 2) if ($pdf);
 	check_missing(\%map);

 	return if (!$need && !$optional);
@@ -397,6 +396,7 @@ sub give_redhat_hints()
 		"Pod::Usage"		=> "perl-Pod-Usage",
 		"xelatex"		=> "texlive-xetex-bin",
 		"rsvg-convert"		=> "librsvg2-tools",
+		"dvipng"		=> "texlive-dvipng",
 	);

 	my @fedora26_opt_pkgs = (
@@ -757,6 +757,7 @@ sub check_needs()
 	check_python_module("sphinx_rtd_theme", 1) if (!$virtualenv);
 	check_program("dot", 1);
 	check_program("convert", 1);
+	check_program("dvipng", 2);

 	# Extra PDF files - should use 2 for is_optional
 	check_program("xelatex", 2) if ($pdf);
