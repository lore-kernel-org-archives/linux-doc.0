Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C5ACD13D2
	for <linux-doc@archiver.kernel.org>; Mon, 18 Sep 2023 10:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241025AbjIRKEO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Sep 2023 06:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241160AbjIRKEG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Sep 2023 06:04:06 -0400
X-Greylist: delayed 96 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 18 Sep 2023 03:03:27 PDT
Received: from out-225.mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5041B6
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 03:03:27 -0700 (PDT)
Message-ID: <63f877b6-1142-82ac-a723-5dc276137283@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1695031406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I7CCUtzpFyVJe8OYH3sV6PVFJjf3eVrAFsKZXKvWBQs=;
        b=FuCVJodPWMzfz9YkUl9Zi6jjOAjS5DVNBa70Yer3aVnRhDly6/83fNJelMLEzsVVAHpFlx
        xwZBKN1qEGxIlMw46t58pyPZIEDaQqYEX8FF0dEzGu8RYp7mmXzo4pqF9M50UOhtR0ehgh
        9YI937b16fUv3hIq2xBQ5q1zPiOn5/c=
Date:   Mon, 18 Sep 2023 11:03:22 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Documentation: dpll: wrap DPLL_CMD_PIN_GET output in
 a code block
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Networking <netdev@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>
References: <20230918093240.29824-1-bagasdotme@gmail.com>
 <20230918093240.29824-3-bagasdotme@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230918093240.29824-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/09/2023 10:32, Bagas Sanjaya wrote:
> DPLL_CMD_PIN_GET netlink command output for mux-type pins looks ugly
> with normal paragraph formatting. Format it as a code block instead.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

> ---
>   Documentation/driver-api/dpll.rst | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
> index 01eb4de867036f..69670deb8c4e09 100644
> --- a/Documentation/driver-api/dpll.rst
> +++ b/Documentation/driver-api/dpll.rst
> @@ -119,19 +119,19 @@ with.
>   If a pin was registered with multiple parent pins, they behave like a
>   multiple output multiplexer. In this case output of a
>   ``DPLL_CMD_PIN_GET`` would contain multiple pin-parent nested
> -attributes with current state related to each parent, like:
> +attributes with current state related to each parent, like::
>   
> -'pin': [{{
> -  'clock-id': 282574471561216,
> -  'module-name': 'ice',
> -  'capabilities': 4,
> -  'id': 13,
> -  'parent-pin': [
> -  {'parent-id': 2, 'state': 'connected'},
> -  {'parent-id': 3, 'state': 'disconnected'}
> -  ],
> -  'type': 'synce-eth-port'
> -  }}]
> +        'pin': [{{
> +          'clock-id': 282574471561216,
> +          'module-name': 'ice',
> +          'capabilities': 4,
> +          'id': 13,
> +          'parent-pin': [
> +          {'parent-id': 2, 'state': 'connected'},
> +          {'parent-id': 3, 'state': 'disconnected'}
> +          ],
> +          'type': 'synce-eth-port'
> +          }}]
>   
>   Only one child pin can provide its signal to the parent MUX-type pin at
>   a time, the selection is done by requesting change of a child pin state

