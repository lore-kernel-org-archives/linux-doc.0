Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACE1C7619A
	for <linux-doc@archiver.kernel.org>; Wed,  5 Apr 2023 20:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjDEUdg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Apr 2023 16:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjDEUdg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Apr 2023 16:33:36 -0400
X-Greylist: delayed 446 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 05 Apr 2023 13:33:32 PDT
Received: from mail.rackland.de (mail.rackland.de [212.86.200.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3222E4C
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 13:33:32 -0700 (PDT)
Received: from [192.168.164.190] (ip5b403bd5.dynamic.kabel-deutschland.de [91.64.59.213])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by mail.rackland.de (Postfix) with ESMTPSA id 8F6F160707
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 22:26:04 +0200 (CEST)
Message-ID: <3fca7d35-8d79-8181-b00d-d35824106b5d@danisch.de>
Date:   Wed, 5 Apr 2023 22:26:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To:     linux-doc@vger.kernel.org
Content-Language: en-US
From:   Hadmut Danisch <hadmut@danisch.de>
Subject: Missing macvlan documentation
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,


docs.kernel.org has a page about the IPVLAN network driver at

https://docs.kernel.org/networking/ipvlan.html

which even refers to the MACVLAN driver, but there is no page about the 
MACVLAN and its options. Quite difficult to find reliable documentation 
about the macvlan driver and modes.


best regards

Hadmut Danisch



