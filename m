Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7288EC48BDF
	for <linux-doc@archiver.kernel.org>; Sun, 20 Jun 2021 10:41:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48BA061002
	for <linux-doc@archiver.kernel.org>; Sun, 20 Jun 2021 10:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhFTKnN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Jun 2021 06:43:13 -0400
Received: from m32-153.88.com ([43.250.32.153]:29570 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229553AbhFTKnM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 20 Jun 2021 06:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=oeiGwaMEXFJgezB4CrmAuWjFv/Qb0Xdcjx0Mv
        W0gGa4=; b=j4MCscuSVuINwbc8orgmEpH0HUD6AN9W8PJqlCx/YpftcnGPgIIPv
        IGP2GOn4siwZ6iyDER9Zs+9zpgHFhnDgzo+mzL3HfafwFwrKEX4egbpcAlvPt9bd
        5Cgr/pG9V/U0yQl5w2vdH05e26Oo7w1NnG1fGGMzX5QtRffYxMUTFs=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXrfwnG89gWlYgAA--.2306S2;
        Sun, 20 Jun 2021 18:40:41 +0800 (CST)
Date:   Sun, 20 Jun 2021 18:40:39 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 0/2] docs/zh_CN: Add two new translations in zh_CN/admin-guide
Message-ID: <cover.1624169811.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXrfwnG89gWlYgAA--.2306S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFyxCF4UJFWDAw1fZw1fZwb_yoWxCFgEvw
        n7XrZYyF17AFyxGFW8ur1UAFyDCF4Yg3yqyFy5trWUJ3yDGw4DXr1kXF1kG3yrWr4qyrW5
        G3ykJryfKrnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8twCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7xRRXdb5UUUUU==
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add two new translations 
    zh_CN/admin-guide/efi-stub.rst
    zh_CN/admin-guide/initrd.rst

Wu XiangCheng (2):
  docs/zh_CN: Add translation zh_CN/admin-guide/efi-stub.rst
  docs/zh_CN: Add translation zh_CN/admin-guide/initrd.rst

 .../zh_CN/admin-guide/efi-stub.rst            |  86 +++++
 .../translations/zh_CN/admin-guide/index.rst  |   4 +-
 .../translations/zh_CN/admin-guide/initrd.rst | 324 ++++++++++++++++++
 3 files changed, 412 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/efi-stub.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/initrd.rst

-- 
2.20.1

