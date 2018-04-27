Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1397D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 23:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932700AbeD0XbZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 19:31:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932444AbeD0XbY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 19:31:24 -0400
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com [209.85.161.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABD5721920;
        Fri, 27 Apr 2018 23:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD5721920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=atull@kernel.org
Received: by mail-yw0-f178.google.com with SMTP id y123-v6so1064143ywa.5;
        Fri, 27 Apr 2018 16:31:23 -0700 (PDT)
X-Gm-Message-State: ALQs6tCk68Xajl+L5WeRLybg5PJWLovkfn5vJMBxNksnKqeFZFqyZ5Ux
        yQs22MHOLZbT6gDrcqkwdY7WbBqtYYgNROYBvNY=
X-Google-Smtp-Source: AB8JxZpEkmuGyjgZE7DaM2yr/UihXB0NcKF+QMDkqLzdyG052QVesC926bJN27miKPAs5wf8ZvoWso4JqiH2RqWHAGg=
X-Received: by 2002:a81:6cd4:: with SMTP id h203-v6mr2070257ywc.48.1524871882911;
 Fri, 27 Apr 2018 16:31:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:8406:0:0:0:0:0 with HTTP; Fri, 27 Apr 2018 16:30:42
 -0700 (PDT)
In-Reply-To: <152cb232-ea4d-292b-8b60-8bdc1732dc23@gmail.com>
References: <20180427012605.28981-1-mdf@kernel.org> <20180427012605.28981-3-mdf@kernel.org>
 <152cb232-ea4d-292b-8b60-8bdc1732dc23@gmail.com>
From:   Alan Tull <atull@kernel.org>
Date:   Fri, 27 Apr 2018 18:30:42 -0500
X-Gmail-Original-Message-ID: <CANk1AXTZhCA78eX9j5dg1VeNyg8G4+hsiSgG_CYpZObjJw+wfw@mail.gmail.com>
Message-ID: <CANk1AXTZhCA78eX9j5dg1VeNyg8G4+hsiSgG_CYpZObjJw+wfw@mail.gmail.com>
Subject: Re: [PATCH 2/4] fpga: manager: change api, don't use drvdata
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Moritz Fischer <mdf@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 27, 2018 at 1:26 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 04/26/2018 06:26 PM, Moritz Fischer wrote:
>> From: Alan Tull <atull@kernel.org>
>>
>> Change fpga_mgr_register to not set or use drvdata.  This supports
>> the case where a PCIe device has more than one manager.
>>
>> Add fpga_mgr_create/free functions.  Change fpga_mgr_register and
>> fpga_mgr_unregister functions to take the mgr struct as their only
>> parameter.
>>
>>   struct fpga_manager *fpga_mgr_create(struct device *dev,
>>                 const char *name,
>>                 const struct fpga_manager_ops *mops,
>>                 void *priv);
>>   void fpga_mgr_free(struct fpga_manager *mgr);
>>   int fpga_mgr_register(struct fpga_manager *mgr);
>>   void fpga_mgr_unregister(struct fpga_manager *mgr);
>>
>> Update the drivers that call fpga_mgr_register with the new API.
>
> Apologies for chiming in so late, this commit does not make it clear
> that fpga_mgr_unregister() now also free the 'mgr' argument by calling
> fpga_mgr_free(), this is kind of detail, but an API should make that
> clear IMHO.

If people follow the usage information, in
Documentation/fpga/fpga-mgr.txt, they'll do the right thing.  But I
can add a patch that clarifies the description of fpga_mgr_unregister
in fpga-mgr.c that it "unregisters and frees" the manager.

>
> Thanks
> --
> Florian
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
