Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DAAC77B6C
	for <linux-doc@archiver.kernel.org>; Thu, 13 Apr 2023 03:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjDMDfZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 Apr 2023 23:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjDMDfH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Apr 2023 23:35:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD7283CC;
        Wed, 12 Apr 2023 20:35:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5ABA463A1E;
        Thu, 13 Apr 2023 03:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF10C433EF;
        Thu, 13 Apr 2023 03:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681356901;
        bh=rpTOShEt7WFV/HeS+ADKohhQwe6BCzAr5M17MqUv1dA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W+CnNi477tF3vvqQ6Ih+bxmmazTbxa9lmbVi8Ay548kvHACzhv2CShqr/sQyGkqVg
         eEiS1rGwu1fEoCF7QHqVhBv28G7Q76Zzb5JRTfMYmnb+BUvOClOu59MQAo/icW5oqr
         y2SdR/a9fZjInpPrHgB+YH53i/7j2s9aYHiyvACBtDhXgRPl0HLRx46bspRRZkoLQC
         Fom2cvuRRCx+jwJjsvev6Wt/e8BQBoJ9QlOcHgBSzMoZ03evZrDkL2VNW06RMgsdzV
         5Nb7bxuJ6h0ajdkTpJgzmqKhyP15Wj8nsnytSrVd3oz4iBUgynJwnE1ZB20pBQEkG5
         Xaza7QZqi0GgQ==
Date:   Wed, 12 Apr 2023 20:35:00 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc:     jiri@resnulli.us, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, richardcochran@gmail.com,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [RFC PATCH v1] ice: add CGU info to devlink info callback
Message-ID: <20230412203500.36fb7c36@kernel.org>
In-Reply-To: <20230412133811.2518336-1-arkadiusz.kubalewski@intel.com>
References: <20230412133811.2518336-1-arkadiusz.kubalewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 12 Apr 2023 15:38:11 +0200 Arkadiusz Kubalewski wrote:
> If Clock Generation Unit and dplls are present on NIC board user shall
> know its details.
> Provide the devlink info callback with a new:
> - fixed type object `cgu.id` - hardware variant of onboard CGU
> - running type object `fw.cgu` - CGU firmware version
> - running type object `fw.cgu.build` - CGU configuration build version
> 
> These information shall be known for debugging purposes.
> 
> Test (on NIC board with CGU)
> $ devlink dev info <bus_name>/<dev_name> | grep cgu
>         cgu.id 8032
>         fw.cgu 6021
>         fw.cgu.build 0x1030001
> 
> Test (on NIC board without CGU)
> $ devlink dev info <bus_name>/<dev_name> | grep cgu -c
> 0
> 
> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Is it flashed together with the rest of the FW components of the NIC?
Or the update method is different?
