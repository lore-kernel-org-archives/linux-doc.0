Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE61A7DE76
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 03:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751548AbeCTDTY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 23:19:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:19276 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751069AbeCTDTX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Mar 2018 23:19:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Mar 2018 20:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,333,1517904000"; 
   d="scan'208";a="29471790"
Received: from rzhang-dell-9360.sh.intel.com ([10.239.197.116])
  by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2018 20:19:21 -0700
Message-ID: <1521515960.2284.1.camel@intel.com>
Subject: Re: [PATCH V4] thermal: Add cooling device's statistics in sysfs
From:   Zhang Rui <rui.zhang@intel.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Date:   Tue, 20 Mar 2018 11:19:20 +0800
In-Reply-To: <20180320013836.hiu6oy3smwmk35tp@vireshk-mac-ubuntu>
References: <6e557b90950723065d49c9a545146ce31d7dc6e1.1516096153.git.viresh.kumar@linaro.org>
         <1520924571.3766.8.camel@intel.com> <1521014472.2087.32.camel@intel.com>
         <20180314081426.GG15832@vireshk-i7>
         <20180320013836.hiu6oy3smwmk35tp@vireshk-mac-ubuntu>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 二, 2018-03-20 at 09:38 +0800, Viresh Kumar wrote:
> On 14-03-18, 13:44, Viresh Kumar wrote:
> > 
> > I got those warnings as well, and I quietly ignored them :)
> > 
> > I ignored the renaming part for the sake of consistency. The other
> > existing
> > routines for similar purpose are named as:
> > 
> > thermal_cooling_device_type_show
> > thermal_cooling_device_max_state_show
> > thermal_cooling_device_cur_state_show
> > thermal_cooling_device_cur_state_store
> > 
> > for me it made more sense to follow that naming convention. And I
> > didn't use the
> > _RO and _WO variants for the same reason.
> > 
> > Now here is what I propose now:
> > 
> > - You apply this patch as-is and ignore the warning.
> > 
> > - I will send few patches on top of that to do:
> >   - renaming of all such routines to shorter versions.
> >   - Use the _RO or _WO variants of the macro everywhere.
> > 
> > What do you say ?
> @Zhang: Can you please share the way you want this to get merged ?
> And if the
> above is fine with you ?
> 
yes, it works for me.
I will apply the patch later today.

thanks,
rui
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
