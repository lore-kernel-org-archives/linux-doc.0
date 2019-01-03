Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2D227D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Jan 2019 20:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfACUxw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 15:53:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:43636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbfACUxw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Jan 2019 15:53:52 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4568F218D3
        for <linux-doc@vger.kernel.org>; Thu,  3 Jan 2019 20:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1546548831;
        bh=DJccjT7VmOv8jpaOnDgZEhgnwzWX/G89zhWAZJacaZI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wenAEFFX391VfQsYmPXUTP3TYKwvpdhVtX7ORHW3gNjyhZCxw6ngdRfnguRCbg/br
         x7hwNmilU80+0eMYxLQpEcVwQlkb79JZ6IpE2SKAY1DmYL8WH4DSxxIPb1VTw6x2UI
         KSPQ2UH214urviJrle6uS7iK7RlfGc6e7PrEAV6M=
Received: by mail-qk1-f179.google.com with SMTP id d15so5955510qkj.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Jan 2019 12:53:51 -0800 (PST)
X-Gm-Message-State: AJcUukcigrTU252X1meJnSjAlv39f2qu+lP0PCYprGV0QeejGt4tATN/
        b74cEaPZlc/XS1SS1X+ZX0CT7RbxpiA80kNCiw==
X-Google-Smtp-Source: ALg8bN71nTse1puwEizvWp/poWezRGm1afcqZfDYHkVmEeF62jnDhF7D81aZRtVE7krkxUbir266ivip15kR2U0yIR4=
X-Received: by 2002:a37:b646:: with SMTP id g67mr45664170qkf.326.1546548830342;
 Thu, 03 Jan 2019 12:53:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546457946.git.ottosabart@seberm.com> <e37cabca16342ce3889957b606274e6588254682.1546457947.git.ottosabart@seberm.com>
In-Reply-To: <e37cabca16342ce3889957b606274e6588254682.1546457947.git.ottosabart@seberm.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 3 Jan 2019 14:53:38 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJW=zxvsptwEh94KP7rEMMgj_HKZ7zTVtC2y_wno_jPHw@mail.gmail.com>
Message-ID: <CAL_JsqJW=zxvsptwEh94KP7rEMMgj_HKZ7zTVtC2y_wno_jPHw@mail.gmail.com>
Subject: Re: [PATCH 3/8] doc: bindings: fix bad reference to ARM CPU bindings
To:     Otto Sabart <ottosabart@seberm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 3, 2019 at 1:04 PM Otto Sabart <ottosabart@seberm.com> wrote:
>
> The primecell.txt and cpus.txt files were converted into YAML. This
> patch updates old references with new ones.
>
> Fixes: d3c207eeb905 ("dt-bindings: arm: Convert primecell binding to json-schema")
> Fixes: 672951cbd1b7 ("dt-bindings: arm: Convert cpu binding to json-schema")
> Signed-off-by: Otto Sabart <ottosabart@seberm.com>
> ---
>
> As suggested by Jon Corbet, I am *resending* this patch once again to
> correct maintainers. There are no changes in the code since my previous
> e-mail.

Please use scripts/get_maintainers.pl so you get the right lists too.

>
> Please review.

Am I supposed to apply? I don't have a clue because I've only gotten patch 3.

>
>  Documentation/devicetree/bindings/arm/cpu-capacity.txt          | 2 +-
>  Documentation/devicetree/bindings/arm/idle-states.txt           | 2 +-
>  Documentation/devicetree/bindings/arm/sp810.txt                 | 2 +-
>  Documentation/devicetree/bindings/arm/topology.txt              | 2 +-
>  Documentation/devicetree/bindings/display/arm,pl11x.txt         | 2 +-
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
