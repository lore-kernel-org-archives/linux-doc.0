Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0A0C7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Sep 2018 13:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbeICSDb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Sep 2018 14:03:31 -0400
Received: from mx2.suse.de ([195.135.220.15]:45342 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725982AbeICSDa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 3 Sep 2018 14:03:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CE834AE46;
        Mon,  3 Sep 2018 13:43:14 +0000 (UTC)
Date:   Mon, 3 Sep 2018 15:43:13 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Harry Cutts <hcutts@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     linux-input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jiri.kosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 1/5] Add the `REL_WHEEL_HI_RES` event code
In-Reply-To: <20180830215622.47550-2-hcutts@chromium.org>
Message-ID: <nycvar.YFH.7.76.1809031542370.25787@cbobk.fhfr.pm>
References: <20180830215622.47550-1-hcutts@chromium.org> <20180830215622.47550-2-hcutts@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 30 Aug 2018, Harry Cutts wrote:

> This event code represents scroll reports from high-resolution wheels,
> and will be used by future patches in this series. See the linux-input
> "Reporting high-resolution scroll events" thread [0] for more details.
> 
> [0]: https://www.spinics.net/lists/linux-input/msg57380.html
> 
> Signed-off-by: Harry Cutts <hcutts@chromium.org>
> ---
> 
> Changes in v2: None
> 
>  Documentation/input/event-codes.rst    | 11 ++++++++++-
>  include/uapi/linux/input-event-codes.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index a8c0873beb95..cef220c176a4 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -190,7 +190,16 @@ A few EV_REL codes have special meanings:
>  * REL_WHEEL, REL_HWHEEL:
>  
>    - These codes are used for vertical and horizontal scroll wheels,
> -    respectively.
> +    respectively. The value is the number of "notches" moved on the wheel, the
> +    physical size of which varies by device. For high-resolution wheels (which
> +    report multiple events for each notch of movement, or do not have notches)
> +    this may be an approximation based on the high-resolution scroll events.
> +
> +* REL_WHEEL_HI_RES:
> +
> +  - If a vertical scroll wheel supports high-resolution scrolling, this code
> +    will be emitted in addition to REL_WHEEL. The value is the (approximate)
> +    distance travelled by the user's finger, in microns.
>  
>  EV_ABS
>  ------
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 53fbae27b280..dad8d3890a3a 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -708,6 +708,7 @@
>  #define REL_DIAL		0x07
>  #define REL_WHEEL		0x08
>  #define REL_MISC		0x09
> +#define REL_WHEEL_HI_RES	0x0a
>  #define REL_MAX			0x0f
>  #define REL_CNT			(REL_MAX+1)

Dmitry, is this OK with you?

Thanks,

-- 
Jiri Kosina
SUSE Labs

