Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6457EB8FAF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Sep 2023 11:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238697AbjIFLxo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjIFLxn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Sep 2023 07:53:43 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC327199;
        Wed,  6 Sep 2023 04:53:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75EAC433C8;
        Wed,  6 Sep 2023 11:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694001219;
        bh=bwfka+JpEPprvMJfxECixELCrmxr7bmCc76S67cIWJc=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=pMq9vRCjBQipcs/aGh/mqFdWLTVT6zoNUA45SoqJkid4FVZFVHUKDSkn8We/Lnk49
         Sl4CzaRMQEeJR+5N+R98d62v8tOnx4oBqbZw2c+7MrGq3BruD17BAF6+lkbDb8ERuF
         s++0s/mxgKte4JV8lE75+9388UVUqZcjtSgk3aweApo1nb3wta8sy6tALPX8aC6WNj
         EYPa9T2cMpc2dPujrkpRxZtl4d4QgL2FTl8OfK9I5Xg6CFaUTolcjrShhaucDCI03/
         U589q3S+QVP08oGXMJvETk42p4BPPJNtCBSgLccvNLp79AYZ8YJxwoY8BXX4fl0ZNR
         plgeXBLDN5VEw==
Message-ID: <e4f53f712d7a98c974fc04788720ce78.mripard@kernel.org>
Date:   Wed, 06 Sep 2023 11:53:36 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Sarah Walker" <sarah.walker@imgtec.com>
Subject: Re: [PATCH v6 07/20] drm/imagination: Add GPU register headers
In-Reply-To: <20230906095542.3280699-8-sarah.walker@imgtec.com>
References: <20230906095542.3280699-8-sarah.walker@imgtec.com>
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

On Wed, 6 Sep 2023 10:55:29 +0100, Sarah Walker wrote:
> Changes since v5:
> - Split up header commit due to size
> 
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
