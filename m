Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEC9ECAAD5
	for <linux-doc@archiver.kernel.org>; Mon,  5 Sep 2022 16:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbiIEQmB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Sep 2022 12:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiIEQmA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Sep 2022 12:42:00 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0EA61705
        for <linux-doc@vger.kernel.org>; Mon,  5 Sep 2022 09:41:57 -0700 (PDT)
Date:   Tue, 6 Sep 2022 00:41:35 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1662396115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jyLVuub9uM5Bf3NcGkkjvfqR8HwJTNgQZ5CABq3x5Fk=;
        b=M/oXMx4k6e8IHTiM7RidbArRhMP89lcBmMubb62c7KgmWt88RCKVF5VA86TdY8ZqpeT0dE
        eTn6TyGTUMHdKPXS0DZHNSma17ZU0qFudbFm1/G1cdiwYYUnZJMm5wHC+4z9PZsMA9/Qpq
        KsnFdnWZ9W+uVCYoKLeXNJJ3Wm1PppY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     YanTeng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com,
        corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v1 1/5] docs/zh_CN: add PCI acpi-info translation
Message-ID: <YxYmvxbCIuFV8S0O@bobwxc.mipc>
References: <cover.1662022757.git.siyanteng@loongson.cn>
 <b872e46c98551f94bdae4a8a5f3ed328b9070bd4.1662022757.git.siyanteng@loongson.cn>
 <YxH9b+m8iRn/GRH2@bobwxc.mipc>
 <65774b2e-0a58-590d-0be3-84e8fb9a22da@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65774b2e-0a58-590d-0be3-84e8fb9a22da@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-09-05 (一) 20:27:42 +0800 YanTeng Si 曰：
> BTW:
> 
> 
> I have received some feedback from readers that
> 
> 
> They are used to writing with spaces between Chinese and English, and I
> found that some of the documents we translated have spaces and some do not.
> 
> 
> As the number of documents rises, do we need to follow some conventions to
> make the documents look better?

"spaces between Chinese and English" are not actual document
informations. Such style/display issue should be implemented by
rendering software rather than add space manually. If someone want a
perfect view experience, they might try Word, Latex or something else
and generate a pdf, those tools will auto add proper spaces. Or they may
improve the sphinx to get a better html.

And one more important, these spaces are easy to add automatically by
the tools, but difficult to remove later.

Existing documents, let it go. New documents, should not go back to this
outdated rule.
 
> 
> Readers gave me this link <https://github.com/sparanoid/chinese-copywriting-guidelines/blob/master/README.zh-Hans.md>
> .

以及我本来不想说的一点，把“「有研究显示，打字的时候不喜欢在中文和英文之间加空
格的人，感情路都走得很辛苦，有七成的比例会在 34 岁的时候跟自己不爱的人结婚，
而其余三成的人最后只能把遗产留给自己的猫。毕竟爱情跟书写都需要适时地留白。
与大家共勉之。」——vinta/paranoid-auto-spacing”这种东西放在教程开头，实在不
是什么好主意，我建议给出参考文献。否则我就得说“有研究显示，打字的时候喜欢乱加
空格的人，一般大脑都比较空白，有七成的比例会在34岁的时候被公司优化，而其余的
三成最后只能去当产品经理。毕竟思考这种东西是不能在空白基础上展开的。与大家
共勉”，权当博各位一笑。

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

