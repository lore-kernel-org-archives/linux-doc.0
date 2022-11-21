Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7316C4332F
	for <linux-doc@archiver.kernel.org>; Mon, 21 Nov 2022 13:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiKUNqP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Nov 2022 08:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbiKUNqL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Nov 2022 08:46:11 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 919482AF
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 05:46:10 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so5387915pjk.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Nov 2022 05:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h4WlfXx1JT8prwGEl+8MjYu4c5Q2z6L6vSGmGXrzDaw=;
        b=ndLUI/i3bhAI+E5Z/rtpMtbU9PQvt4onGoandWxwOQJb9tXJdokAltJo2G8BkMJ5N0
         EuHeb7Wm3rijZjygTxe9Qd4SpukalyeRsrsUXNgZsM+oWB3qvuau76JyfdIxnRJyUOCi
         ze2jzdXpmJGCNRPz1WUYjwbQVdhkgJxx0qQdKaFjd2WoVX570YMulT09mxkxxb/37Ja1
         6wMPMv2AlKtLBgOMSv2/td8injbPbA+UezCFNZPgXF3MmTMRBIECeYgN0LL70aZssI5F
         AAnCK8yDlcOFsDXlOQV7E8vlaroX0/oOUUNPMWM4VvY/3s+iYZAvWRaqybx4plWIH/Di
         1YBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4WlfXx1JT8prwGEl+8MjYu4c5Q2z6L6vSGmGXrzDaw=;
        b=SDcSi8LZoT/rwGDWNoDGrg+3I1cKBLdL4g8cj2I7K18sZwuMFUAFbeA4xd5+swm5pX
         2I/8DcTk7tlQRd1StPqbs4gPYZUVXziZcmTJ0bTFB3T2yBHR/PExOxIg/+R9psFoEgA4
         24HYBABqyW09KEd0Aqt9X5YWOJoLej4p3ydNvFbD54xh9iaYFCPkAv/gHtv8fu3ydLA5
         BGHg4k2Ceh4BAS85bPQxCz9I35SRhhr/XiSAn0DYE/teTm2Cvf3Oi5aVh/CmTGMX35yS
         V7nqDE6mEeLegTNYunb0WV7Po36RWnxmD6jqqBO8ty3gfr8dT+y2x4M5NBi4hUH/0z2v
         KL+A==
X-Gm-Message-State: ANoB5plbNdZXPJXBAfRoQXzLhkoUyPWjBa3oFDyntpuJg8fq48/E3RI/
        RZQZnltP7dFTc4doq2z96K0=
X-Google-Smtp-Source: AA0mqf4A8ftosMJyVXgXwBrr5s4ksbZSkWSAu3C8BOs0IYeQeO1upUq0l0BZD5UnklEPMZAdrWxFnQ==
X-Received: by 2002:a17:902:6505:b0:189:30f:64d8 with SMTP id b5-20020a170902650500b00189030f64d8mr2130894plk.39.1669038369871;
        Mon, 21 Nov 2022 05:46:09 -0800 (PST)
Received: from [192.168.11.9] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id h11-20020aa79f4b000000b0056c6e59fb69sm8672761pfr.83.2022.11.21.05.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 05:46:09 -0800 (PST)
Message-ID: <9f23e62c-1401-cf58-f99b-fa804366cd4c@gmail.com>
Date:   Mon, 21 Nov 2022 22:46:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] docs/driver-api/miscellaneous: Remove kernel-doc of
 serial_core.c
From:   Akira Yokosawa <akiyks@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
References: <4e54c76a-138a-07e0-985a-dd83cb622208@gmail.com>
 <47514c0a-7d5b-5a0b-6bb5-d5c96d163838@gmail.com>
Content-Language: en-US
In-Reply-To: <47514c0a-7d5b-5a0b-6bb5-d5c96d163838@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Wed, 9 Nov 2022 23:45:06 +0900, Akira Yokosawa wrote:
> Hi Jon,
> 
> On Wed, 2 Nov 2022 20:48:01 +0900, Akira Yokosawa wrote:
>> Since merge of tty-6.0-rc1, "make htmldocs" with Sphinx >=3.1 emits
>> a bunch of warnings indicating duplicate kernel-doc comments from
>> drivers/tty/serial/serial_core.c.
>>
>> This is due to the kernel-doc directive for serial_core.c in
>> serial/drivers.rst added in the merge. It conflicts with an existing
>> kernel-doc directive in miscellaneous.rst.
>>
>> Remove the latter directive and resolve the duplicates.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> Fixes: 607ca0f742b7 ("Merge tag 'tty-6.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty")
>> Cc: stable@vger.kernel.org # 6.0
>> Cc: Jiri Slaby <jslaby@suse.cz>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
[...]
> 
> Jon, Greg has added this to his tty tree and (hopefully) it will
> soon land Linus' tree (v6.1-rcX).
> I'll ask you a back-merge once it happens.

This change has landed at v6.1-rc6 as commit 3ec17cb325ac
("docs/driver-api/miscellaneous: Remove kernel-doc of serial_core.c").
Can you please consider backmerging v6.1-rc6?
There is another fix landed at v6.1-rc5 which fixed another duplicate
kernel-doc, commit c18c20f16219 ("mm, slab: remove duplicate kernel-doc
comment for ksize()") authored by Vlastimil.

For your reference, appended below is the diff of warnings of duplicate
from Sphinx >=3.1 (line numbers are omitted):

--- htmldocs-duplicate-docs-next.log	2022-11-21 22:18:19.787652881 +0900
+++ htmldocs-duplicate-backmerge-6.1-rc6.log	2022-11-21 22:18:33.563052797 +0900
@@ -4,126 +4,6 @@
 Declaration is '.. c:function:: int ssam_request_sync (struct ssam_controller *ctrl, const struct ssam_request *spec, struct ssam_response *rsp)'.
 /linux/Documentation/driver-api/usb/usb: ./drivers/usb/core/message.c: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget.
 Declaration is '.. c:function:: int usb_string (struct usb_device *dev, int index, char *buf, size_t size)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: void uart_write_wakeup(struct uart_port *port)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *port'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: void uart_update_timeout(struct uart_port *port, unsigned int cflag, unsigned int baud)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *port'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int cflag'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int baud'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: unsigned int uart_get_baud_rate(struct uart_port *port, struct ktermios *termios, const struct ktermios *old, unsigned int min, unsigned int max)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *port'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct ktermios *termios'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: const struct ktermios *old'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int min'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int max'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: unsigned int uart_get_divisor(struct uart_port *port, unsigned int baud)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *port'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int baud'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: void uart_console_write(struct uart_port *port, const char *s, unsigned int count, void (*putchar)(struct uart_port*, unsigned char))'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *port'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: const char *s'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int count'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: void (*putchar)(struct uart_port*, unsigned char)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: int uart_parse_earlycon(char *p, unsigned char *iotype, resource_size_t *addr, char **options)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: char *p'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned char *iotype'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: resource_size_t *addr'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: char **options'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: void uart_parse_options(const char *options, int *baud, int *parity, int *bits, int *flow)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: const char *options'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int *baud'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int *parity'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int *bits'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int *flow'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: int uart_set_options(struct uart_port *port, struct console *co, int baud, int parity, int bits, int flow)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *port'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct console *co'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int baud'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int parity'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int bits'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: int flow'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: int uart_register_driver(struct uart_driver *drv)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_driver *drv'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: void uart_unregister_driver(struct uart_driver *drv)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_driver *drv'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: int uart_add_one_port(struct uart_driver *drv, struct uart_port *uport)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_driver *drv'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *uport'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: int uart_remove_one_port(struct uart_driver *drv, struct uart_port *uport)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_driver *drv'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *uport'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: bool uart_match_port(const struct uart_port *port1, const struct uart_port *port2)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: const struct uart_port *port1'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: const struct uart_port *port2'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: void uart_handle_dcd_change(struct uart_port *uport, unsigned int status)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *uport'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int status'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: void uart_handle_cts_change(struct uart_port *uport, unsigned int status)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *uport'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int status'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:function:: bool uart_try_toggle_sysrq(struct uart_port *port, unsigned int ch)'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: struct uart_port *port'.
-/linux/Documentation/driver-api/serial/driver.rst: WARNING: Duplicate C declaration, also defined at driver-api/miscellaneous.
-Declaration is '.. c:None:: unsigned int ch'.
 /linux/Documentation/driver-api/usb/usb.rst: WARNING: Duplicate C declaration, also defined at driver-api/usb/gadget.
 Declaration is '.. c:struct:: usb_string'.
 /linux/Documentation/gpu/amdgpu/driver-core: ./drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c: WARNING: Duplicate C declaration, also defined at gpu/amdgpu/driver-core.
@@ -142,5 +22,3 @@
 Declaration is '.. c:function:: void cfg80211_rx_assoc_resp (struct net_device *dev, struct cfg80211_rx_assoc_resp *data)'.
 /linux/Documentation/driver-api/80211/mac80211: ./include/net/mac80211.h: WARNING: Duplicate C declaration, also defined at driver-api/80211/mac80211.
 Declaration is '.. c:function:: void ieee80211_tx_status (struct ieee80211_hw *hw, struct sk_buff *skb)'.
-/linux/Documentation/core-api/mm-api: ./mm/slab_common.c: WARNING: Duplicate C declaration, also defined at core-api/mm-api.
-Declaration is '.. c:function:: size_t ksize (const void *objp)'.

        Thanks, Akira


