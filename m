Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2541EE14D0
	for <linux-doc@archiver.kernel.org>; Wed,  6 Sep 2023 19:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244090AbjIFTEv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Sep 2023 15:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244054AbjIFTEk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Sep 2023 15:04:40 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0B51FD9
        for <linux-doc@vger.kernel.org>; Wed,  6 Sep 2023 12:04:05 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d74a012e613so137237276.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Sep 2023 12:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694027023; x=1694631823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z7JfMeTWIa2dMIiQZF3QfNFt+waJmFYaLRg5N1AX5A=;
        b=eo+K1xA7ms6DFDGW/npp6j1DlZ9ma2kXzhbQMBJ4a2VgYVEFXPkeaBQVVADWrSkaaL
         4H0NyWrMepvuD7mzRqytOve+hi6s5VTklS43E6CUeVRcvDEL5KY8gDQSQrqpVmtXxYzP
         0Pb8AvCA7doDlXW/pQ//NIGzftAAN9rB9gc8magZoSt7z7gct3D4KXUu8sosZXN1uyd7
         qi29bkrHpWfjTBTnC2vmdtrwnJVdpmyhWtKUrkZe4JrgwwZCgIxsB7CP2gSNbTN2iSU/
         3Mmf4JaYShJ93KiHxmzJBP52gBRm7RX9rOiHAybadKPBvgekIYFJaV7k2M6XHRHfZ08e
         rB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694027023; x=1694631823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8z7JfMeTWIa2dMIiQZF3QfNFt+waJmFYaLRg5N1AX5A=;
        b=Vvs1KkhqPtz/+WnzF8FxJ6yDq+fXVuWxIyF8m7Qsd5Oiln76a3NJYV137cQvKVS+hg
         64XIukt2xTExe78xY4X3x8F2kmdt0+akNKP22XiJLfeBtPe4+C7F48i9GfQ6SMNoacYp
         nP2blbkFJajaPWlw686RF87X8nF4cecDRjkUhy2GYk8GYKuYd3jauhZufwjs3Y/79uGH
         gb4U6QhGz18HLeEmtvfw7TtA7e8R+eFMqeQsdRKfn9H99HE8+lKAXc9t3KYio0jveQ6J
         tAujiEhM+g6Fgg9R4pH/TPJokjItxIzuGj//qfmetd8Ai3oLURu4NrazqvQsF6Fqgu0q
         GCDg==
X-Gm-Message-State: AOJu0YxvnYXAag8yiu+i+ThKDd6Ir1OwwDXyxkvuLrNse9HD3HONdgtE
        tMMhq8iu9jNOk8hoXRcC2vXqOz+rPRN4t404885J4A==
X-Google-Smtp-Source: AGHT+IH86FyU3nX8IvvfomZQMTa9OGpwmdFMH+65w5YXwKbO2KVUTcIKAGjBIG77tJnR85zEQ4SNo0g2UWc6erEZNP4=
X-Received: by 2002:a25:a429:0:b0:d79:e08f:e9c2 with SMTP id
 f38-20020a25a429000000b00d79e08fe9c2mr496388ybi.11.1694027023098; Wed, 06 Sep
 2023 12:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230906095542.3280699-1-sarah.walker@imgtec.com> <20230906095542.3280699-4-sarah.walker@imgtec.com>
In-Reply-To: <20230906095542.3280699-4-sarah.walker@imgtec.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Sep 2023 21:03:31 +0200
Message-ID: <CACRpkdaNbr_7ivzz=fam2rup0HYH6UivBexLDWLLyWiXDSHoOA@mail.gmail.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
To:     Sarah Walker <sarah.walker@imgtec.com>
Cc:     dri-devel@lists.freedesktop.org, frank.binns@imgtec.com,
        donald.robson@imgtec.com, boris.brezillon@collabora.com,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, corbet@lwn.net, christian.koenig@amd.com,
        matt.coster@imgtec.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        faith.ekstrand@collabora.com, afd@ti.com, hns@goldelico.com,
        matthew.brost@intel.com, luben.tuikov@amd.com, dakr@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 6, 2023 at 11:56=E2=80=AFAM Sarah Walker <sarah.walker@imgtec.c=
om> wrote:

> Add the device tree binding documentation for the IMG AXE GPU used in
> TI AM62 SoCs.
>
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
> ---
> Changes since v5:
> - Update compatible string & description to match marketing name
> - Remove unnecessary clock-names definition in ti,am62-gpu constraints
> - Document that GPU revision is discoverable

This looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
