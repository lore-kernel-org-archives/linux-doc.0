Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE07C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 02:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239557AbiEKCGO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 May 2022 22:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241074AbiEKCGI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 May 2022 22:06:08 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D462EA0F
        for <linux-doc@vger.kernel.org>; Tue, 10 May 2022 19:06:06 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 137so530215pgb.5
        for <linux-doc@vger.kernel.org>; Tue, 10 May 2022 19:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DaOqUQVR1l6iFHmgR6ojWOiOGRT0ZXEbqPVNv0WKOWg=;
        b=gM2FlFD45yjzMYGI0yxkGudyWBn0pdTJ21XLjHgc/eeTtFlPTdizS+F5ddfW0ZVsIv
         mcCrkbVWEFIJqxc80Mo/bIKIyk+mkBMYT5lht2OJoh6dnqrj8iJpGhW/PeTNz+F1urs2
         +Iis9KDgGBRhaNmCLwGYL29QjcxRexYe5gBjmEZrA6FJ1CV/nlFPfDvIMCuih9FfWPOM
         YfXV6n49JFoVJwrsvy3V0NwIOS9GiNFgsB7zLDm82vuFxTRbF9ZEEmghgcGbko7/Km1o
         0UcyQ/APMUmoTMgnOFP7ml83z3hnGtQrRtc4gCc8pALIKNLH3FB0p9iT/cnbFpVw/Em2
         rGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DaOqUQVR1l6iFHmgR6ojWOiOGRT0ZXEbqPVNv0WKOWg=;
        b=7Ak4ahdH1sfmYT4QuQbFtR2CrPtDX+d7wflD8oipkuVRJ6L+YftIYIyN3o2PAeYsEL
         yl9/Q3Sb+WfVtr+em4T7i0HyCuudZKWFL9m9w5cc3XeiI67nUDS2G2UlDcCXfiIz3GMV
         WTFiOv1aSi+u/OKHIz27Tgkr/yApRlMACabEMuHDaa3DDXEf2k/khDcm5Eho8tlfWW4G
         E12YNsXHv6El2iVHKtc49SG9T2fp6duRjWBUI9fMBBvz0f/g6xf5PpFnve5rWnllco0H
         82FJVHOGobjtJ6AZbjr/Xu4x8wPF4jmRkGuuioegeYlGfbYyVjnRjkyQESHaogOWEESz
         396w==
X-Gm-Message-State: AOAM533c9kRc9K14SENah9+++NTfZZ5w9Sobnp0p3hwoU+4ETQ+5qsse
        V9tkkx3UX+6OwcdOW4bhilQ=
X-Google-Smtp-Source: ABdhPJy7Y5f6zuMZbyTT9buuGH3/8IHFbGIp1uyIeMa4rEA9mhxGGH+JaBBODe8rSlWU6RhFTG93DA==
X-Received: by 2002:a63:6c8a:0:b0:3ab:8c07:4d93 with SMTP id h132-20020a636c8a000000b003ab8c074d93mr19284646pgc.431.1652234765915;
        Tue, 10 May 2022 19:06:05 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id np3-20020a17090b4c4300b001da160621d1sm349129pjb.45.2022.05.10.19.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 19:06:05 -0700 (PDT)
Message-ID: <c30f0524-7847-bd60-709a-8e847e87f86c@gmail.com>
Date:   Wed, 11 May 2022 10:05:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] docs/zh_CN: add devicetree changesets translation
Content-Language: en-US
To:     =?UTF-8?B?6ZmI5a2m5YW1?= <chenxuebing@jari.cn>, alexs@kernel.org,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
References: <5c04a23b.8d9.180ae707e5c.Coremail.chenxuebing@jari.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <5c04a23b.8d9.180ae707e5c.Coremail.chenxuebing@jari.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 5/10/22 22:47, 陈学兵 wrote:
> ​Translate .../Devicetree/changesets.rst into Chinese.
> 
> 
> Signed-off-by: XueBing Chen <chenxuebing@jari.cn>
> ---
>  .../zh_CN/devicetree/changesets.rst           | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/devicetree/changesets.rst
> 
> 
> diff --git a/Documentation/translations/zh_CN/devicetree/changesets.rst b/Documentation/translations/zh_CN/devicetree/changesets.rst
> new file mode 100644
> index 000000000000..4aade1f26f1b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/devicetree/changesets.rst
> @@ -0,0 +1,31 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +:Original: Documentation/Devicetree/changesets.rst

Hi xuebing,

no this file, You'd better run 'make htmldocs', then setup a webserver
and check if new file show correctly in web browser.


> +
> +:翻译:
> +
> + 陈学兵 XueBing Chen <chenxuebing@jari.cn>
> +
> +:校译:

need a blank line.

> +=====================
> +Devicetree 变更集
> +=====================
> +
> +Devicetree变更集是一种允许在活动树中应用变更的方法，其方式是要么应用全套变更，
> +要么不应用任何变更。如果在应用变更集的过程中发生错误，则树将回滚到以前的状态。
> +变更集也可以在应用后删除。
> +
> +应用变更集时，所有变更都会在发出 OF_RECONFIG 通知之前立即应用到树上。
> +这是为了让接收方在接收通知程序时看到树的完整一致状态。
> +
> +变更集的顺序如下所示：
> +
> +1. of_changeset_init() - 初始化变更集
> +
> +2. DT树的更改需要一组调用：of_changeset_attach_node()、of_changeset_detach_node()、

please take care the line width, align with your above lines, less than 80.

Thanks
Alex
> +of_changeset_add_property()、of_changeset_remove_property 和 of_changeset_update_property()。
> +此时不会对活动树进行任何更改。所有变更操作都记录在 of_changeset'entries'列表中。
> +
> +3. of_changeset_apply() - 将更改应用于树。要么应用整个变更集，要么如果出现错误，树将恢复到以前的状态。
> +核心是通过锁来确保正确的序列化。如果需要，可以使用 __of_changeset_apply 解锁版本 。
> +
> +如果需要删除成功应用的变更集，可以使用 of_changeset_revert()完成。
