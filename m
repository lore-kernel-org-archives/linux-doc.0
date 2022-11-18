Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FDCC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 18 Nov 2022 00:12:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiKRAMh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Nov 2022 19:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239916AbiKRAMg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Nov 2022 19:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B1E61BAA
        for <linux-doc@vger.kernel.org>; Thu, 17 Nov 2022 16:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668730302;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=t75IuiAQcMlm4oCjhALxycpb3Fn6D89zCbLbH8xoMhU=;
        b=RZcU4J8/NRVL5oMka86uKBamtnu9yaG6aFk5SsE9We4SOmaETV3qgrHQgbELjM8qwIWjfi
        LqyCeYI6/4sYYf1oHFnzGvkzjcbHkNuSiqkQBrc/DfeHpU+ZZKLT8nPMv/3E7UfqW5Loa/
        n/Tg+atdPWgclgCG0/554EGjQOHjZs8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-gFkoYcibN7O9y4IdUg4itA-1; Thu, 17 Nov 2022 19:11:39 -0500
X-MC-Unique: gFkoYcibN7O9y4IdUg4itA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6114B1C068CC;
        Fri, 18 Nov 2022 00:11:38 +0000 (UTC)
Received: from localhost (ovpn-12-17.pek2.redhat.com [10.72.12.17])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DDC1492B04;
        Fri, 18 Nov 2022 00:11:37 +0000 (UTC)
Date:   Fri, 18 Nov 2022 08:11:33 +0800
From:   Baoquan He <bhe@redhat.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc:     Xianting Tian <xianting.tian@linux.alibaba.com>,
        anup@brainfault.org, heiko@sntech.de, guoren@kernel.org,
        mick@ics.forth.gr, alexandre.ghiti@canonical.com,
        vgoyal@redhat.com, dyoung@redhat.com, corbet@lwn.net,
        Conor.Dooley@microchip.com, bagasdotme@gmail.com,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
        k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com
Subject: Re: [PATCH V5 0/2] Support VMCOREINFO export for RISCV64
Message-ID: <Y3bNtRekTdzVMMdK@MiWiFi-R3L-srv>
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi risc-v maintainers,

On 10/26/22 at 10:42pm, Xianting Tian wrote:
> As disscussed in below patch set, the patch of 'describe VMCOREINFO export in Documentation'
> need to update according to Bagas's comments. 
> https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D113444@kernel.org/
> 
> As others patches in above patch set already applied, so this patch set only contains below two
> patches.

Could you pick this patchset into risc-v tree since it has got acks
and two Tested-by?

Thanks
Baoquan

