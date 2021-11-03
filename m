Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BD4C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 17:26:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2B56610EA
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 17:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhKCR2i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Nov 2021 13:28:38 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:40541 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229698AbhKCR2i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Nov 2021 13:28:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id B062D2B011FB
        for <linux-doc@vger.kernel.org>; Wed,  3 Nov 2021 13:26:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 03 Nov 2021 13:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.in; h=
        date:from:to:subject:message-id:mime-version:content-type; s=
        fm1; bh=LvARWnDDe5W5QKGFLchaI5AnvZSEsKQtEzGpl1gPeIc=; b=YGnTBbsO
        Fiuqyuj4oJ+in4uPJ5NNeCQwZUXZsWgLdJ6v4tbKkG5oP3a54DZt5X6Rd6N/EFwL
        aQOcYp31aeoajeCLPAJEkBpyVbw1azdpE3/C90m6r3H8UAVZ3iaORm3ziGZB31P6
        dqTJX2O8UW4D+g1ZSl9pUnVpSXdciA2BBKAXN1vPMW5jy187Zkm+n9CKpBQH0839
        3VY0v2gJfFZt5QKHrZElUG6N8K2UJQE5RE+0rYLkl81Y0IX4MnxDDEGDZQ2HQw99
        stilDyt+B25fFfr5DZvTnU2jibB4ai6GqOeAtwUWIrXQhhhURhruT/7OhrN54T7b
        r0lEZN54pgCaXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm1; bh=LvARWnDDe5W5QKGFLchaI5AnvZSEs
        KQtEzGpl1gPeIc=; b=DdszsOg9MuPd1yiIusWpdvBHLsUAbic9rilvE9cwyUuoF
        Go2g/8sHFLVQ/GfnvMEuxa8A5ew8CWe/0eJi2DqWML6y4U3KkWwVLgCCC8Cwk+Q5
        w9TtCqVVPzG87EuixJQcp6lM/M5ZT02Be8me2/P6msuZfpCecTWSEDRXppw4cm6A
        RtR+uxOzssPuPrdJfQk9aLMyhwasVCDy4lC4S7uVmlxY0UBGJMQOx/IozpDAS/6j
        CPpegolrUYyiRD1CeaBdoFtzk7DHt+vt+MOfxTN7qcuR4OWnmPgBTaI0RcoUsUL8
        nzBiVZN9uSxBupW8a9Ut87i8Ff95O0yhqN0Tta8Fg==
X-ME-Sender: <xms:KMaCYVYJ-RGdBPZHcvBxIc8Whz09t3qssqPxMC--h_uJeO1wuI18pg>
    <xme:KMaCYcZZqtztTZkz-jrEkrIs1ScJ0jNXPQI-cwjJuKSv4aVSVgtVWW_6gbbo9XTpW
    PjooWcQvic6sJ03gf8>
X-ME-Received: <xmr:KMaCYX91GG8WBClc7smxAPZX2sxtEgF03zL1GrBW076Irikx2tjOfpCY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdelkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertddttd
    dvnecuhfhrohhmpeffvggvphcuofgrjhhumhguvghruceouggvvghpsehfrghsthhmrghi
    lhdrihhnqeenucggtffrrghtthgvrhhnpedtkefhkeegueehvdeiheelvddufeeivddtge
    ettddtgfffgfegueetffelfeeghfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvvghpse
    hfrghsthhmrghilhdrihhn
X-ME-Proxy: <xmx:KMaCYTqN8f57hHJMF0ADhmjaqyJSaDNBn_ckxa-1RZaFLZvh-cmcIQ>
    <xmx:KMaCYQoCd0v7VK2Hyywa8IDc2aoLvjqjK7kPxDYPN9HVkX74LeEEhQ>
    <xmx:KMaCYZR2nxtX4rzo7PoVTO_24OwL0ws02rBJEeVn-6oJMJ9ewjxaHg>
    <xmx:KMaCYWG_GaN62lfsi1ppgtXAeH-jplVlFEhSoN1HUCieNCDYMILTUVALztw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <linux-doc@vger.kernel.org>; Wed, 3 Nov 2021 13:26:00 -0400 (EDT)
Date:   Wed, 3 Nov 2021 22:55:57 +0530
From:   Deep Majumder <deep@fastmail.in>
To:     linux-doc@vger.kernel.org
Subject: Is this is the correct list to send patches on documentation bugs?
Message-ID: <20211103172557.a557bttpaytvs6og@pop-os.localdomain>
Mail-Followup-To: linux-doc@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi everyone,
I have found a bug in an area in the Linux kernel documentation (ie, the
one available at https://www.kernel.org/doc/html/latest/).
Is this the correct mailing list to send a patch for the same?
Warm regards,
Deep Majumder
