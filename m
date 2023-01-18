Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71E8C677F1
	for <linux-doc@archiver.kernel.org>; Wed, 18 Jan 2023 09:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjARJYl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 04:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbjARJVP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 04:21:15 -0500
Received: from fx601.security-mail.net (smtpout140.security-mail.net [85.31.212.146])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768495D7CE
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 00:45:01 -0800 (PST)
Received: from localhost (fx601.security-mail.net [127.0.0.1])
        by fx601.security-mail.net (Postfix) with ESMTP id 2705D349932
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 09:44:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1674031499;
        bh=WwGy6LWSOQ5SJyonbI5rWpgW7QWdqYGjLuHllAVb+WE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=XPT4WogQDik/URvJgsuwrtwmhSY2pANuuVkORmEQUlhLX37Z1cd7xRgQBey+Pv5pU
         9yi598lHQgToGSqkhxKmDJsPZzULYWdg49Dzy1GTJP/rYk92A1dAMNshy9vWRTIZGl
         vhLlGfi1YPy9G7jZiQfuogY+E0gGx7oo7ijSAH+A=
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id F3DB03498FF; Wed, 18 Jan
 2023 09:44:58 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx601.security-mail.net (Postfix) with ESMTPS id 3B5313498C4; Wed, 18 Jan
 2023 09:44:58 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 12AC927E041F; Wed, 18 Jan 2023
 09:44:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id EC84327E042C; Wed, 18 Jan 2023 09:44:57 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 BBmFW3appBD3; Wed, 18 Jan 2023 09:44:57 +0100 (CET)
Received: from [127.0.0.1] (unknown [192.168.37.161]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id A1AD727E041F; Wed, 18 Jan 2023 09:44:57 +0100
 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <16215.63c7b18a.38895.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu EC84327E042C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674031498;
 bh=bf7v0SEN3SyB8aE/V6Wx1brZXEnyAC5SOTVF4J3ECRk=;
 h=Message-ID:Date:MIME-Version:To:From;
 b=cp5d2izr0T5HRQ4N44k37mgSB4M9E0YUAom1Et1CwYen/GyqLyQwR3+S4SmxXYo3s
 TieJh2yUSipzQl9kKYX5/ptw/IGSG7nudhWZ/hQDLdFiohbNSwXY7U9KbpWVpbMHNp
 97ObM/Jis5Ri9iDLT7GJxeyv5SIBdP/HlAIin+vw=
Message-ID: <59004ccf-4262-7acf-dfe5-3468000016c9@kalray.eu>
Date:   Wed, 18 Jan 2023 09:44:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/25] Documentation: kvx: Add basic documentation
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clement Leger <clement.leger@bootlin.com>,
        Guillaume Thouvenin <gthouvenin@kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <20230103164359.24347-2-ysionneau@kalray.eu> <874jt7fqxt.fsf@meer.lwn.net>
Content-Language: en-us
From:   Yann Sionneau <ysionneau@kalray.eu>
In-Reply-To: <874jt7fqxt.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/01/2023 18:50, Jonathan Corbet wrote:

> Yann Sionneau <ysionneau@kalray.eu> writes:
>
>> Add some documentation for kvx arch and its Linux port.
>>
>> CC: Jonathan Corbet <corbet@lwn.net>
>> CC: linux-doc@vger.kernel.org
>> CC: linux-kernel@vger.kernel.org
>> Co-developed-by: Clement Leger <clement.leger@bootlin.com>
>> Signed-off-by: Clement Leger <clement.leger@bootlin.com>
>> Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
>> Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
>> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
>> ---
>>   Documentation/kvx/kvx-exceptions.txt | 246 ++++++++++++++++++++++++
>>   Documentation/kvx/kvx-iommu.txt      | 183 ++++++++++++++++++
>>   Documentation/kvx/kvx-mmu.txt        | 272 +++++++++++++++++++++++++++
>>   Documentation/kvx/kvx-smp.txt        |  36 ++++
>>   Documentation/kvx/kvx.txt            | 268 ++++++++++++++++++++++++++
>>   5 files changed, 1005 insertions(+)
>>   create mode 100644 Documentation/kvx/kvx-exceptions.txt
>>   create mode 100644 Documentation/kvx/kvx-iommu.txt
>>   create mode 100644 Documentation/kvx/kvx-mmu.txt
>>   create mode 100644 Documentation/kvx/kvx-smp.txt
>>   create mode 100644 Documentation/kvx/kvx.txt
> Please write this documentation in the RST format (you're 95% of the way
> there now) and incorporate into the kernel docs build.

Ack, it will be part of the V2, thanks for the review.

-- 

Yann





