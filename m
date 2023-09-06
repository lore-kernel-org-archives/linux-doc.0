Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4872EEB8FB8
	for <linux-doc@archiver.kernel.org>; Wed,  6 Sep 2023 11:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236369AbjIFLgO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235315AbjIFLgN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Sep 2023 07:36:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E7F1987;
        Wed,  6 Sep 2023 04:36:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7FBC433C8;
        Wed,  6 Sep 2023 11:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694000162;
        bh=XvZQw/D6OS4nurgc67PWjQY0smNSqPLGy1z+2Y7iLEE=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=qAbNrWUfTm6JFrqriekyq9HXVlp5/O/Kyhggcyf6moJCv8OjJVkjl90iQaGT5FVUb
         PIKhM7545DtydKwRk8SZQu2LVPjeoFBxj9VD0DhFl0jc3lKeNgB9hHLgeKZFAXB1Mh
         Orh1iB/4Za+xNq7vly8Y3LSeSrgrxXGEc+yCj6r4VYkUsO25AG6+HEyBTCkPPqJSvd
         POQPjLajrsSSScEkcG4O2JR+2Hnox1onqoXzsyUpdaHCOHGyCQfz627MBi8T/WRdTT
         LotE6Ozif+HT4R1YRUnKEjZh0gvK+ZKg7jd0kLWxjb8CV8j3/yINYSsv3yuUEd43PG
         w9is3v6yibUxw==
Message-ID: <c8360c51a96a457a8b9341a9918f0c52.mripard@kernel.org>
Date:   Wed, 06 Sep 2023 11:36:00 +0000
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
