Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEB7EB8FAF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Sep 2023 11:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbjIFLok (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbjIFLoj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Sep 2023 07:44:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D5BA9;
        Wed,  6 Sep 2023 04:44:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B468C433C7;
        Wed,  6 Sep 2023 11:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694000676;
        bh=XnFe3s3A3Ru8jKj/08Ae1zwa7j3vIpvIRhg0ZwHTLbo=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=VhSCjapFeoOW/31gOJkdyFgRuKBq+wWe+Xy0etG8NPeQsvRViNPS0zIeEOOYOHce8
         vhHsUDj8lmCNidhNiR/xtlf8xuaW3gzgQzq9TAkm+bbaAWt8s6lZXC2q22whefz+EI
         76y7rZ10DCeq7KGbKkvssYsM7rzxOi54AQZ1oulYIEa/XpyCRnPlrJL2x8Nik+4XPe
         9xuvoq6KiXGK/Z/7Amx803WrJ5wu8zORrYjb1OAq2St5RSTl8z+FOBhVXAhI423+Hv
         kX+ssc5Qm0fCWJ6oBwxCHvNYzBUQZWH23zuComnYJH/XftnecEIJIqcsrjGwqqhFNp
         zm1ZY3WDpczMw==
Message-ID: <7f766389e365ae3ca23772ac9aac5254.mripard@kernel.org>
Date:   Wed, 06 Sep 2023 11:44:33 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 09/20] drm/imagination: Add FWIF headers
In-Reply-To: <20230906095542.3280699-10-sarah.walker@imgtec.com>
References: <20230906095542.3280699-10-sarah.walker@imgtec.com>
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
        tzimmermann@suse.de, "Maxime Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 6 Sep 2023 10:55:31 +0100, Sarah Walker wrote:
> Changes since v5:
> - Split up header commit due to size
> - Add BRN 71242 to device info
> 
> Changes since v4:
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
