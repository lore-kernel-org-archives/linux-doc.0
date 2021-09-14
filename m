Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F55AC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 14:35:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C34F6108B
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 14:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbhINOgV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 10:36:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:57448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233871AbhINOeJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Sep 2021 10:34:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEA8261246;
        Tue, 14 Sep 2021 14:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631629970;
        bh=WxyGnxo+FzGm9PhZyiDXnwPUXyOwSSnCmekF+R0AxQU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lLELpdOivNjHmYNY4dU8zruxpC99U+/Ojej0AmoKXIh4r0fM6QWgpZKCgml0yOY8z
         22wJ6xQl4jt3lijtcXrPwCrvYzWUsxVj9AMqa4Y3UCCLfaGfmxCV+UUJikPp3m+QSb
         x0ji995jTjvyp0z2uS/P3OW1pYyHMaTitqNMJOjNf5h4GQPSfmQYxUkZifSbN/J6Uy
         XPJzHjRKTKA1LU9EkeXaI4+oanfGcQNCbGq68fMWEa9dfbeZbs44QSw5rrXrYKyRNh
         hMdtSxJhb6OeyjM13a/R0U+FKgIcOJyv8+tCAgAJmuazjgdMO79OdRk/166FXBDkiz
         KA0kiHWyHlJEQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQ9UO-000KlE-2w; Tue, 14 Sep 2021 16:32:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/29] ABI: sysfs-bus-soundwire-slave: use wildcards on What definitions
Date:   Tue, 14 Sep 2021 16:32:31 +0200
Message-Id: <5b868cdb441090cd9c1c4fcc593f069d1b1023d9.1631629496.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631629496.git.mchehab+huawei@kernel.org>
References: <cover.1631629496.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An "N" upper letter is not a wildcard, nor can easily be identified
by script, specially since the USB sysfs define things like.
bNumInterfaces. Use, instead, <N>, in order to let script/get_abi.pl
to convert it into a Regex.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-bus-soundwire-slave | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
index d324aa0b678f..db6b8ffa753e 100644
--- a/Documentation/ABI/testing/sysfs-bus-soundwire-slave
+++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
@@ -64,7 +64,7 @@ Description:	SoundWire Slave Data Port-0 DisCo properties.
 		Data port 0 are used by the bus to configure the Data Port 0.
 
 
-What:		/sys/bus/soundwire/devices/sdw:.../dpN_src/max_word
+What:		/sys/bus/soundwire/devices/sdw:.../dp<N>_src/max_word
 		/sys/bus/soundwire/devices/sdw:.../dpN_src/min_word
 		/sys/bus/soundwire/devices/sdw:.../dpN_src/words
 		/sys/bus/soundwire/devices/sdw:.../dpN_src/type
-- 
2.31.1

