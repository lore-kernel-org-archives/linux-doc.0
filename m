Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1181C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 17 May 2022 13:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238363AbiEQNQe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 May 2022 09:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347636AbiEQNQ2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 09:16:28 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5357C15
        for <linux-doc@vger.kernel.org>; Tue, 17 May 2022 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=h5+AHg7GKGRU5YmPBN+4Rd5gnU4UY8p5DeTyH
        FO1K/c=; b=eDwCox3+vcVO69ssDIy7fFFjkIh3E65caiLtuU23meTeWntYpHDL4
        1CyJvM4mn6FKTzuOxW1h/Ab3g+81Upe0aOIkS0fDKnAAZoThxbTm/SEEvtSzPW2S
        wCk2gc8hL9SJx4JbaSzUvG2JscNe9zdteQGvAAbcTewXpch1AFYA3Q=
Received: from bobwxc.mipc (unknown [120.242.69.144])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAHbb0goINiz8WGAA--.8018S2;
        Tue, 17 May 2022 21:16:17 +0800 (CST)
Date:   Tue, 17 May 2022 21:16:15 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 0/2] docs/zh_CN: sync reporting-issues.rst to 247097e2bbff4
Message-ID: <cover.1652792205.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CM-TRANSID: LCKnCgAHbb0goINiz8WGAA--.8018S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZry7Xr1kAryrXr1ruF45KFg_yoWxZFc_u3
        95Was3trWxCa4rtFW8WF1YvrZ09w43C34F9w4Uta93Gr4fXrsxWwn5GF90q345XFW7AFy7
        G3yUXws7KrnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbY8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcV
        Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1U
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6ry8MxAIw28Icx
        kI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjxU1_MaUUUUU
X-Originating-IP: [120.242.69.144]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

sync zh_CN/admin-guide/reporting-issues.rst to newest version
(commit 247097e2bbff4)

There are two patches in the same name, the first acturally been
reviewed by Alex and Yanteng last year , see <https://lore.kernel.org/linux-doc/CAMU9jJor_V_G6wG1vWnDvgQADeXaPxg9E47w27nk_sBNGJpuEg@mail.gmail.com/>,
but not been picked up yet. So I rebase it to newest docs-next and resend
it. Then bring a new sync commit.

Thanks!

Wu XiangCheng (2):
  docs/zh_CN: sync reporting-issues.rst
  docs/zh_CN: sync reporting-issues.rst

 .../zh_CN/admin-guide/reporting-issues.rst    | 125 +++++++++++-------
 1 file changed, 79 insertions(+), 46 deletions(-)

-- 
2.30.2

