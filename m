Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71B4C4338F
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 07:35:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7E7C60F42
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jul 2021 07:35:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhGZGye (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jul 2021 02:54:34 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:35097 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232390AbhGZGyd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jul 2021 02:54:33 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 92C9D320046E;
        Mon, 26 Jul 2021 03:35:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 26 Jul 2021 03:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=+
        Hd8H6m8YlL2vLtdz16jMge3p5gN60j3XSEsZmOqpXk=; b=qpiT3dvgAZgijoFw5
        FI3/10GvSPcs8h8x5hdTvjirbJsi1nubsfrMIN2Pchc2DVX8rWDa7Wqa+rhsxWVU
        kjOsHVGvd/QHZJrs+8vgUJ3ZcgZDgY5JcEKOaFfvhvu55l3VFIU+f2k8fSBKLRgv
        CYVfh0oiBZHqqOtwotD/F0YObaC5nuPpOnkMqQf3xprzJ/v+AswgdskI2PGVSp8p
        q2iS7Zr7qqb4P6WDjmWXBSwYubZNJyOCPMzZtGFJ4nmnSEVwZdeL85vcs8x2Kpyf
        QyBJqWt94ntO5ExTyTIuLm5qA0JszxTS+jFt5v0rRMiOata9HRhmjxtpN7aqH7QQ
        wF/+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=+Hd8H6m8YlL2vLtdz16jMge3p5gN60j3XSEsZmOqp
        Xk=; b=UKcfN7jYR6LA19OzjMoSBJF5e44i53ykTa0jgcZkl879jmV7bpymiMlsP
        WpqlIfZ6AQE6iAkwbHNUW2+T18spxh56Poo0DjeG3QP/LIyYFof0ph6RI+VHTCfv
        A3gTrTVnzPVrmK7oaOVYAyYXUp4DmFdvO0iR9rHdGrdcutGhbCPOT+qXBNuNFSIV
        0k0VMFWrL5gSu+/qwNoIVT46kTgqXYqrACO7eEXp571mx7dwqUR2pbR8DxW5MMG5
        SrEZMolxXvhM9t2R673N1xUeE8GtZZOGlKzsnrfT6im8E2pNs7voKy5BQVCSouUz
        kJYfA41XT04Kalln8xor2s+XHlDiw==
X-ME-Sender: <xms:o2X-YBGBGMnmn9w6H3HDlHWrGiKfeQOmAJe49UU6fCUEKoV0b9uLNw>
    <xme:o2X-YGVWBqX0gukPIbMhZR9VR3oazEDxTX9h7iXPtSmogQVgTlk3kpVpgrN0FBKTd
    EglN_4-G6uuo2n7Pq0>
X-ME-Received: <xmr:o2X-YDLfzScdZHi4RjBE9Rw9-SBMdRe5_x6L4CufULGKxOu3AFLMM6FZ_HUm9xUGruJxZHalstLR9j-0sfF_CiRygaAS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeeggdduudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:o2X-YHFgKkxq8XLA6-8QPJdAyL7BBXhwG0EiZb4CZNFMyPcaOD7txw>
    <xmx:o2X-YHVaIKPK0M2VAKXS5i27JDfBBsVimh_X3lIFoZH89FvcsjMEsA>
    <xmx:o2X-YCM-zuBRl7pLKK4h4tSBkdWMHJZnIyOc50MCTPaRrGf6LHwYlQ>
    <xmx:pWX-YOFDduuj6PY5WGR1oxZUKL0RD0zfJJDvjTfVVB0jNQLmlT0PjA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 03:34:54 -0400 (EDT)
Subject: Re: [PATCH 0/8] docs/zh_CN: add infiniband translation.
To:     Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
References: <cover.1624525360.git.siyanteng@loongson.cn>
 <87wnpet961.fsf@meer.lwn.net>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <152f8f96-5c0b-2bdd-caa7-31dc8af001cf@flygoat.com>
Date:   Mon, 26 Jul 2021 15:34:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <87wnpet961.fsf@meer.lwn.net>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



ÔÚ 2021/7/26 ÉÏÎç4:45, Jonathan Corbet Ð´µÀ:
> Yanteng Si <siyanteng@loongson.cn> writes:
>
>> translation linux-next/Documentation/infiniband/* into Chinese.
>>
>> Yanteng Si (8):
>>    docs/zh_CN: add infiniband index translation
>>    docs/zh_CN: add infiniband core_locking translation
>>    docs/zh_CN: add infiniband ipoib translation
>>    docs/zh_CN: add infiniband opa_vnic translation
>>    docs/zh_CN: add infiniband sysfs translation
>>    docs/zh_CN: add infiniband tag_matching translation
>>    docs/zh_CN: add infiniband user_mad translation
>>    docs/zh_CN: add infiniband user_verbs translation
>>
>>   Documentation/translations/zh_CN/index.rst    |   2 +-
>>   .../zh_CN/infiniband/core_locking.rst         | 114 ++++++++++++
>>   .../translations/zh_CN/infiniband/index.rst   |  39 +++++
>>   .../translations/zh_CN/infiniband/ipoib.rst   | 110 ++++++++++++
>>   .../zh_CN/infiniband/opa_vnic.rst             | 155 +++++++++++++++++
>>   .../translations/zh_CN/infiniband/sysfs.rst   |  20 +++
>>   .../zh_CN/infiniband/tag_matching.rst         |  62 +++++++
>>   .../zh_CN/infiniband/user_mad.rst             | 163 ++++++++++++++++++
>>   .../zh_CN/infiniband/user_verbs.rst           |  71 ++++++++
>>   9 files changed, 735 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/core_locking.rst
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/index.rst
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/ipoib.rst
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/opa_vnic.rst
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/sysfs.rst
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/tag_matching.rst
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/user_mad.rst
>>   create mode 100644 Documentation/translations/zh_CN/infiniband/user_verbs.rst
> So these have been waiting for a month without review...is there any
> chance somebody can take a look at them?

I guess most of us don't have experience on infiniband so it might be 
hard for
us to determine if the translation is accurate. :-(

Thanks,

- Jiaxun

>
> Thanks,
>
> jon

