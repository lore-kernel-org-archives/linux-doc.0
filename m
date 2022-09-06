Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5D7ECAAD5
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 18:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiIFSEx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 14:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiIFSEn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 14:04:43 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1204F15A3A
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 11:04:41 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id lx1so25048513ejb.12
        for <linux-doc@vger.kernel.org>; Tue, 06 Sep 2022 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Q/vVBxqYeXmrksomZ9APU4huzqDahCsJnE5dSEWl5QY=;
        b=laF+n7CQLGLN4yPbDOjRIp38L3CKEpQDTfCAhEvG50QD3Fa2pBZhMC7lEY+BUqU1rb
         263eHQHvfCxZPx6PUQ2obWafmL/3P9wD4tqvtrKaGznWJYrtuxPCuFFgASE84VJWnuoh
         1zy1lREjoZo4/9d5dTMnBkUjV4ekRvFDh5Zs+v+AJfcQxh4jRNFvTok0BjRA3imuG+p6
         6CC3SsqYvcJgskjORp2Zl/IQQrPhPLaNst8dohpZK7maMn//KV1Lx4CEN6bWpK+UVVA8
         XMHurEWXz1y7iayRlfTy7FL2cSo2+lF+TjsoOce4HTTRHzaIibNIX9ZwaWi5y62OooA3
         GwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Q/vVBxqYeXmrksomZ9APU4huzqDahCsJnE5dSEWl5QY=;
        b=N8Ym6KqDpliKADuXJVnupD0NcWnwW4C62rzWhhq+sAcuyDZG4bNkUjxdlgOaBg/64Q
         dpAE1Z/W4Wi2Cj6BSy0WFFaczzcH5Ov9xY9/gOkDrs12oXPR/eutPConxyOWteDA0d2j
         K2eFBrLB0awyEOTtymUYYl8iAjD23FBXD5EkyheobA42IARPX5bAUt6eTr6yawNtenA3
         H0ofyMhsLqhj4XNrkINdcHBYN5Xxx1z+4zT3XWkr8o/n52ZjSmW8Fe7v0M6L9q04jf80
         lvvv++76BylmIuQ16T+EOWagjfLk/heluS5UD4EWm44exa/3M+MN/lEwc9UkrFd8XwxA
         oohw==
X-Gm-Message-State: ACgBeo2W55I+KGjDs+0qxN+VsBP5IikBE4OxkMr0NdgukdHNiOjadduN
        ZexdcqFWq9L7dnhUGmrGdDKNBH51WOp/IGyf
X-Google-Smtp-Source: AA6agR4gsqbGkqF1g4c8PTeVlAHgWhvrq+laWsaG1ZOh8wtnCcPJAbm34wHAAl4sbo3ZH5+bg2uOvg==
X-Received: by 2002:a17:907:2da6:b0:741:608f:718c with SMTP id gt38-20020a1709072da600b00741608f718cmr33278883ejc.271.1662487479437;
        Tue, 06 Sep 2022 11:04:39 -0700 (PDT)
Received: from vdi08.nix.tessares.net (static.219.156.76.144.clients.your-server.de. [144.76.156.219])
        by smtp.gmail.com with ESMTPSA id t6-20020a170906948600b00731745a7e62sm7007845ejx.28.2022.09.06.11.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 11:04:38 -0700 (PDT)
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
To:     Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     netdev@vger.kernel.org, mptcp@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net 2/2] Documentation: mptcp: fix pm_type formatting
Date:   Tue,  6 Sep 2022 20:04:02 +0200
Message-Id: <20220906180404.1255873-2-matthieu.baerts@tessares.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906180404.1255873-1-matthieu.baerts@tessares.net>
References: <20220906180404.1255873-1-matthieu.baerts@tessares.net>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029; i=matthieu.baerts@tessares.net;
 h=from:subject; bh=L1K4QWp7M2QRB/sPKCRB8Rr7k+B107Dosp9R9gfi1nA=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBjF4uEva7htLdH2Ayc/rx4vDypHoJ5ErCzDhNIrX3j
 zG8ujEaJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCYxeLhAAKCRD2t4JPQmmgc+7ED/
 4jnDbAJ3+NlfXymFfVZ0jnfbBiFWgS5oV+vBqQG+6qYIdLpvMqiObFxByMy5mkhnTN62CfHzYAqR4e
 e8sdwKUNe7Xeut9LpCVeQyvJJXmpcG0oUltWB7l0s102dgak2mpe8zSIDL/hIYjeTL+uF+TGE1q5Dr
 4Q3+umm3X0nWY9eStdcT20IE/SiqIxUcXFx4RROZQ50cV8F/1BpNsPkeBgGWvtu2zqaxFwomjda77R
 IW/RNUMS7WeTunXcZzNPJqpIL+rFuld4FfjbTphiLph29n5KlOiPVIoBNMEGpyvusrSwlFxMrZCbmR
 fwbikEAVHaqL8wibWauut3e0oWLvHrHMWRO6W2JRxbafs2PwZ7Yld12i0+jmOWdBvBW34wlesr0utf
 IvUwIqd/bP8UBrzX2lK9FnIgqB0YHj3ysYAMMJIzxG/3yMq/fDdnkLdhGqmZoEp0Yc6J4kziyL4+OI
 nz+v2CuxgagFtilFdMhnyxfbEiMo6yEV54eJjX6kdLxgLcgn8mW3Yn2hsGabksw4WISwjMGajX86AC
 GoZvey5d1ogSVT7I2Ay91+dyjsee82/rskgFW3nYA6UfiHtoZJtc8D+pMmib0J95bbSSK4V74kcw16
 zkxe2FFHyboKisoSpyq7N0PTicKiV7E8vZtUQjy4stAQnFMr6SzdtUN1ht/g==
X-Developer-Key: i=matthieu.baerts@tessares.net; a=openpgp; fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When looking at the rendered HTML version, we can see 'pm_type' is not
displayed with a bold font:

  https://docs.kernel.org/5.19/networking/mptcp-sysctl.html

The empty line under 'pm_type' is then removed to have the same style as
the others.

Fixes: 6bb63ccc25d4 ("mptcp: Add a per-namespace sysctl to set the default path manager type")
Signed-off-by: Matthieu Baerts <matthieu.baerts@tessares.net>
---
 Documentation/networking/mptcp-sysctl.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/networking/mptcp-sysctl.rst b/Documentation/networking/mptcp-sysctl.rst
index e263dfcc4b40..213510698014 100644
--- a/Documentation/networking/mptcp-sysctl.rst
+++ b/Documentation/networking/mptcp-sysctl.rst
@@ -47,7 +47,6 @@ allow_join_initial_addr_port - BOOLEAN
 	Default: 1
 
 pm_type - INTEGER
-
 	Set the default path manager type to use for each new MPTCP
 	socket. In-kernel path management will control subflow
 	connections and address advertisements according to
-- 
2.37.2

