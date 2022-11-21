Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA86C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 20:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbiKUU7X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 15:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKUU7X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 15:59:23 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 244B3CDFC4
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 12:59:22 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CEA11377;
        Mon, 21 Nov 2022 20:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CEA11377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1669064362; bh=AxSxX8kphaHUIGpOob4uDUmKZa1GVO7ihSKgLda7qzw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HM0GuEYKmSHSgrQ96xrmzdw7LBuz5ydr51iSPiVZh0vqA20yOX6HZ5M5lup1z5WQX
         QyyZfo2pxPmlhjWp5P8C4o5O7/UiG8YZsMhFt3E6SRCP4Lwp5nsLISDaPwy3HBOeSD
         RpvGGz2IBeIy7RrZUGzlTTd3r94MEJHB04bpuzO0EDHF/V/l716sJGf9jHK5OfHHww
         lxHLBC9mJZySME/bTRSKpZqbtWq56TL0sNr4tHEZ317+E490cLtX/F//hzpUdA/VCE
         WckLeJd6GgzHRvu4kNTmpa0bwsOrwD5jP0gNlz2DYXZgReaAw50Xbk3ZMd8HQHQqBr
         w35/GeKMCwMiw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs/driver-api/miscellaneous: Remove kernel-doc of
 serial_core.c
In-Reply-To: <9f23e62c-1401-cf58-f99b-fa804366cd4c@gmail.com>
References: <4e54c76a-138a-07e0-985a-dd83cb622208@gmail.com>
 <47514c0a-7d5b-5a0b-6bb5-d5c96d163838@gmail.com>
 <9f23e62c-1401-cf58-f99b-fa804366cd4c@gmail.com>
Date:   Mon, 21 Nov 2022 13:59:21 -0700
Message-ID: <87sfic9g7q.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Jon,
>
> On Wed, 9 Nov 2022 23:45:06 +0900, Akira Yokosawa wrote:
>> Hi Jon,
>> 
>> On Wed, 2 Nov 2022 20:48:01 +0900, Akira Yokosawa wrote:
>>> Since merge of tty-6.0-rc1, "make htmldocs" with Sphinx >=3.1 emits
>>> a bunch of warnings indicating duplicate kernel-doc comments from
>>> drivers/tty/serial/serial_core.c.
>>>
>>> This is due to the kernel-doc directive for serial_core.c in
>>> serial/drivers.rst added in the merge. It conflicts with an existing
>>> kernel-doc directive in miscellaneous.rst.
>>>
>>> Remove the latter directive and resolve the duplicates.
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> Fixes: 607ca0f742b7 ("Merge tag 'tty-6.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty")
>>> Cc: stable@vger.kernel.org # 6.0
>>> Cc: Jiri Slaby <jslaby@suse.cz>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> ---
> [...]
>> 
>> Jon, Greg has added this to his tty tree and (hopefully) it will
>> soon land Linus' tree (v6.1-rcX).
>> I'll ask you a back-merge once it happens.
>
> This change has landed at v6.1-rc6 as commit 3ec17cb325ac
> ("docs/driver-api/miscellaneous: Remove kernel-doc of serial_core.c").
> Can you please consider backmerging v6.1-rc6?
> There is another fix landed at v6.1-rc5 which fixed another duplicate
> kernel-doc, commit c18c20f16219 ("mm, slab: remove duplicate kernel-doc
> comment for ksize()") authored by Vlastimil.
>
> For your reference, appended below is the diff of warnings of duplicate
> from Sphinx >=3.1 (line numbers are omitted):
>
> --- htmldocs-duplicate-docs-next.log	2022-11-21 22:18:19.787652881 +0900
> +++ htmldocs-duplicate-backmerge-6.1-rc6.log	2022-11-21 22:18:33.563052797 +0900
> @@ -4,126 +4,6 @@
>  Declaration is '.. c:function:: int ssam_request_sync (struct ssam_controller *ctrl, const struct ssam_request *spec, struct ssam_response *rsp)'.
>  /linux/Documentation/driver-api/usb/usb: ./drivers/usb/core/message.c: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget.
>  Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int index, char *buf, size_t size)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: void uart_write_wakeup(struct uart_port *port)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *port'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: void uart_update_timeout(struct uart_port *port, unsigned int cflag, unsigned int baud)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *port'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int cflag'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int baud'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: unsigned int uart_get_baud_rate(struct uart_port *port, struct ktermios *termios, const struct ktermios *old, unsigned int min, unsigned int max)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *port'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct ktermios *termios'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: const struct ktermios *old'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int min'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int max'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: unsigned int uart_get_divisor(struct uart_port *port, unsigned int baud)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *port'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int baud'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: void uart_console_write(struct uart_port *port, const char *s, unsigned int count, void (*putchar)(struct uart_port*, unsigned char))'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *port'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: const char *s'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int count'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: void (*putchar)(struct uart_port*, unsigned char)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: int uart_parse_earlycon(char *p, unsigned char *iotype, resource_size_t *addr, char **options)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: char *p'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned char *iotype'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: resource_size_t *addr'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: char **options'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: void uart_parse_options(const char *options, int *baud, int *parity, int *bits, int *flow)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: const char *options'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int *baud'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int *parity'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int *bits'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int *flow'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: int uart_set_options(struct uart_port *port, struct console *co, int baud, int parity, int bits, int flow)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *port'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct console *co'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int baud'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int parity'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int bits'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: int flow'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: int uart_register_driver(struct uart_driver *drv)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_driver *drv'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: void uart_unregister_driver(struct uart_driver *drv)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_driver *drv'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_driver *drv'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *uport'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: int uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_driver *drv'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *uport'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: bool uart_match_port(const struct uart_port *port1, const struct uart_port *port2)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: const struct uart_port *port1'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: const struct uart_port *port2'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: void uart_handle_dcd_change(struct uart_port *uport, unsigned int status)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *uport'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int status'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: void uart_handle_cts_change(struct uart_port *uport, unsigned int status)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *uport'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int status'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:function:: bool uart_try_toggle_sysrq(struct uart_port *port, unsigned int ch)'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: struct uart_port *port'.
> -/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
> -Declaration is '.. c:None:: unsigned int ch'.
>  /linux/Documentation/driver-api/usb/usb.rst: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget.
>  Declaration is '.. c:struct:: usb_string'.
>  /linux/Documentation/gpu/amdgpu/driver-core: ./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: WARNING: Duplicate C declaration, also defined at gpu/amdgpu/driver-core.
> @@ -142,5 +22,3 @@
>  Declaration is '.. c:function:: void cfg80211_rx_assoc_resp (struct net_device *dev, struct cfg80211_rx_assoc_resp *data)'.
>  /linux/Documentation/driver-api/80211/mac80211: ./include/net/mac80211.h: WARNING: Duplicate C declaration, also defined at driver-api/80211/mac80211.
>  Declaration is '.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)'.
> -/linux/Documentation/core-api/mm-api: ./mm/slab_common.c: WARNING: Duplicate C declaration, also defined at core-api/mm-api.
> -Declaration is '.. c:function:: size_t ksize (const void *objp)'.
>
>         Thanks, Akira
