Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1590AEB8FA5
	for <linux-doc@archiver.kernel.org>; Wed,  6 Sep 2023 11:36:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239937AbjIFLgc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:36:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235315AbjIFLgb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Sep 2023 07:36:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B3D171C;
        Wed,  6 Sep 2023 04:36:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E168CC433C7;
        Wed,  6 Sep 2023 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694000181;
        bh=XvZQw/D6OS4nurgc67PWjQY0smNSqPLGy1z+2Y7iLEE=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=RvDQJ04t9UEd4Oi2krSltHz7ad7T65t3srpDJPL7Fzli6KXVBDFqHYPd5o+Cvyt9F
         9I0AYTcjn/A3TLM/Ae6RN+h5D9JfdHJL9cpe5oR1QSWSSHpgu7ukLoMer/bZvpdtSH
         +i6288tsyUsCa4e+p5heEEejhKTR08PSKhlzwzIo+KqlsWoW55n7O58rWS6U3x74ot
         rCvBA8WDFug3IXzRne6dxavXHvr7IGS2vyecXnM0zuuLlmZYExwxl2fCc8dsfwm604
         JLXmmkRf3vt3++bXM6kbEO5Vugzsac0xupKSByP4eh4yyeomwxY5Btj08y91dY2EId
         HTWyOrDlpNksA==
Message-ID: <b15931f26e229fd13e4d27fd582940f7.mripard@kernel.org>
Date:   Wed, 06 Sep 2023 11:36:18 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 03/20] dt-bindings: gpu: Add Imagination Technologies
 PowerVR/IMG GPU
In-Reply-To: <20230906095542.3280699-4-sarah.walker@imgtec.com>
References: <20230906095542.3280699-4-sarah.walker@imgtec.com>
Cc:     afd@ti.com, airlied@gmail.com, boris.brezillon@collabora.com,
        christian.koenig@amd.com, conor+dt@kernel.org, corbet@lwn.net,
        dakr@redhat.com, daniel@ffwll.ch, devicetree@vger.kernel.org,
        donald.robson@imgtec.com, dri-devel@lists.freedesktop.org,
        faith.ekstrand@collabora.com, frank.binns@imgtec.com,
        hns@goldelico.com, krzysztof.kozlowski+dt@linaro.org,
        linus.walleij@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, luben.tuikov@amd.com,
        maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com,
        matthew.brost@intel.com, mripard@kernel.org, robh+dt@kernel.org,
        tzimmermann@suse.de
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 6 Sep 2023 10:55:25 +0100, Sarah Walker wrote:
> Add the device tree binding documentation for the IMG AXE GPU used in
> TI AM62 SoCs.
> 
> Co-developed-by: Frank Binns <frank.binns@imgtec.com>
> Signed-off-by: Frank Binns <frank.binns@imgtec.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
