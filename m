Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029EFC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFE2B61185
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbhIPJqF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:46:05 -0400
Received: from 1.mo7.mail-out.ovh.net ([178.33.45.51]:38745 "EHLO
        1.mo7.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235352AbhIPJqF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Sep 2021 05:46:05 -0400
X-Greylist: delayed 604 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Sep 2021 05:46:05 EDT
Received: from player726.ha.ovh.net (unknown [10.110.171.173])
        by mo7.mail-out.ovh.net (Postfix) with ESMTP id A7E1B1B7B01
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 11:34:39 +0200 (CEST)
Received: from RCM-web1.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player726.ha.ovh.net (Postfix) with ESMTPSA id 1C4E5221DD910;
        Thu, 16 Sep 2021 09:34:33 +0000 (UTC)
MIME-Version: 1.0
Date:   Thu, 16 Sep 2021 11:34:32 +0200
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 22/24] MAINTAINERS: update brcm,unimac-mdio.yaml reference
In-Reply-To: <39e251389606fb11d0d5888d76aacaf595643da8.1631783482.git.mchehab+huawei@kernel.org>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
 <39e251389606fb11d0d5888d76aacaf595643da8.1631783482.git.mchehab+huawei@kernel.org>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <9b8d6cab5e682e9fdd3031294ec8efba@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1130122033111215067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvufgjfhgfkfigihgtgfesthejjhdttdervdenucfhrhhomheptfgrfhgrlhgpofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepveefvdetjeffueefkeeuuedvgefhgeegjefgvedvgeeiteduueeivdeltedthfetnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021-09-16 11:14, Mauro Carvalho Chehab wrote:
> Changeset 5d1c5594b646 ("dt-bindings: net: brcm,unimac-mdio: convert
> to the json-schema")
> renamed: Documentation/devicetree/bindings/net/brcm,unimac-mdio.txt
> to: Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml.
> 
> Update its cross-reference accordingly.

Quick question: do we want to reference .yaml files in the MAINTAINERS
at all?

Every YAML has maintainer specified on its own and new YAML files often
come without a MAINTAINERS entry.
