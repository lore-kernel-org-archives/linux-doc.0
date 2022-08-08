Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D703C00140
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 12:52:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233836AbiHHMwN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 08:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbiHHMwM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 08:52:12 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759BADEE5
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 05:52:11 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4422C6601AD1;
        Mon,  8 Aug 2022 13:52:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659963129;
        bh=0scMnYGjSdIjHvwIvP9ms+F7OaWUBOHZH1L24VZ3GPU=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=IeNqOcVR7Bg41U3OJ8l4ZlFTADjgVye6xxaiLWWAiYnHqyszB1Zs3dfa61gmq6yos
         Byl9K1SAJRU/6+LMvAD1tPi3uDA44vwCPegwCjTheetwV9rqSkUxJ0U16yKkrvaAp7
         nfgA4Vl3XPApq4om4suibqMlttqEgSIbXWvjbNKrKmrODfttot6Xd3D28j5svdGs2F
         Hgv4sO1cdKv2r0UFTyt4Ed29Kbz1IFCK2W8QEo+0QVajbQ0TJKMKLApuoYPKW6b+gm
         7HxBg8eEuICcaY+ths5749UVAOa6+vgmWmw5mEvFncafLF3+VFjz3AJIGv2RyzwUO1
         DWGlgQ5y0duUA==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Cornelia Huck <cohuck@redhat.com>, linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, bagasdotme@gmail.com
Subject: Re: [PATCH v2 1/2] virtio: kerneldocs fixes and enhancements
References: <20220804105914.3707389-1-ricardo.canuelo@collabora.com> <20220804105914.3707389-2-ricardo.canuelo@collabora.com> <87edxrdjao.fsf@redhat.com>
In-reply-to: <87edxrdjao.fsf@redhat.com>
Date:   Mon, 08 Aug 2022 14:52:05 +0200
Message-ID: <87leryrj7u.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Cornelia, thanks for the review:

On lun, ago 08 2022 at 14:14:07, Cornelia Huck <cohuck@redhat.com> wrote:
> Isn't that "kerneldoc"? But maybe I'm a bit behind on the current
> terminology.

Ugh what a silly slip. You're totally right, I got kerneldocs and
htmldocs mixed in my head after so many "make htmldocs" tests.

> This is being ignored, however. Append "(ignored)"?

Ack.

> As you're touching this anyway: maybe s/device/virtio device/ ?
> ...
> Same here.

Sure, no problem. I'll prepare v3 with the fixes.

Cheers,
Ricardo
