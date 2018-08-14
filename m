Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6990F7DE5B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 Aug 2018 23:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbeHOCfj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 Aug 2018 22:35:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:36072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbeHOCfj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 Aug 2018 22:35:39 -0400
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com [209.85.161.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD09F21721;
        Tue, 14 Aug 2018 23:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1534290365;
        bh=a1EubMCaSPMw7EIgqmqqc0tHY9si5he3NP/+LKe0II8=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=OJtwelHJ98+6STt7q4uNNv1zvj1FkP1670I7McktbEhQ5xIe33A0klvpS9Vc30H34
         WVjJuZ6cUFyZwY38QHFM6L+dng6qeF0/bshIF8lp1Oc0pqtAZR6kTU3Ag7++vZM0zj
         E6aSDnu9xgwcRJdb9Jf7PljdEDjKTMTIe38/VmMc=
Received: by mail-yw1-f44.google.com with SMTP id r3-v6so17587017ywc.5;
        Tue, 14 Aug 2018 16:46:05 -0700 (PDT)
X-Gm-Message-State: AOUpUlF9yu2+xIxwmLBJjMSpzEW5rbCoR8tglgDEbB2++DZ5xqIwW9tH
        ib4M4ieqTRzbiEw1+nvCUNVgbaU60VBT5qFdw5U=
X-Google-Smtp-Source: AA+uWPxDdNzCoXXlurGhRa3oDGAKQGPEjb5Fl75EXizWI+rJzsn5CxLHgtipivBY6iUaCDJUq6dnOOAlp+f+nFZbkeI=
X-Received: by 2002:a81:8047:: with SMTP id q68-v6mr12716798ywf.196.1534290364968;
 Tue, 14 Aug 2018 16:46:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:81cc:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 16:45:24
 -0700 (PDT)
In-Reply-To: <3975392.G1LtsYJEZq@harkonnen>
References: <20180814191526.3247-1-atull@kernel.org> <3975392.G1LtsYJEZq@harkonnen>
From:   Alan Tull <atull@kernel.org>
Date:   Tue, 14 Aug 2018 18:45:24 -0500
X-Gmail-Original-Message-ID: <CANk1AXR=6kEx6gotxPV_E7KyMCD65qpdpJjmpKd4KSw3XrWogw@mail.gmail.com>
Message-ID: <CANk1AXR=6kEx6gotxPV_E7KyMCD65qpdpJjmpKd4KSw3XrWogw@mail.gmail.com>
Subject: Re: [PATCH 0/8] fpga: Add managed create in FPGA API
To:     Federico Vaga <federico.vaga@cern.ch>
Cc:     Moritz Fischer <mdf@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-fpga@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 14, 2018 at 4:44 PM, Federico Vaga <federico.vaga@cern.ch> wrote:
> Hi Alan,
>
> I think you forgot to add:
>
> Suggested-by: Federico Vaga <federico.vaga@cern.ch>
>
> on patches 2,3,4 which were suggested here
>
> https://lkml.org/lkml/2018/7/26/145
>
> and patch 8 here:
>
> https://lkml.org/lkml/2018/7/18/959

You are right and I appreciate the suggestions.  I credited you on the
patch that this replaces [1].  I'll fix this in v2.

Alan

[1] https://lkml.org/lkml/2018/7/25/721

>
> On Tuesday, August 14, 2018 9:15:18 PM CEST Alan Tull wrote:
>> Fix one functional FPGA bug.
>>
>> Implement managed devm_fpga_(mgr|bridge|region)_create() functions.
>>
>> More documentation cleanup to make the documentation more helpful
>> and to emphasize the use of FPGA regions for FPGA programming.
>>
>> Fix a few minor documentation corrections.
>>
>> Alan Tull (8):
>>   fpga: do not access region struct after fpga_region_unregister
>>   fpga: mgr: add devm_fpga_mgr_create
>>   fpga: bridge: add devm_fpga_bridge_create
>>   fpga: add devm_fpga_region_create
>>   dt-bindings: fpga: fix freeze controller compatible in region doc
>>   fpga: bridge: fix obvious function documentation error
>>   docs: fpga: document fpga manager flags
>>   docs: fpga: document programming fpgas using regions
>>
>>  .../devicetree/bindings/fpga/fpga-region.txt       |   4 +-
>>  Documentation/driver-api/fpga/fpga-bridge.rst      |  37 ++-----
>>  Documentation/driver-api/fpga/fpga-mgr.rst         | 121
>> +++------------------ Documentation/driver-api/fpga/fpga-programming.rst
>> | 103 ++++++++++++++++++ Documentation/driver-api/fpga/fpga-region.rst
>>    |  91 ++++++++-------- Documentation/driver-api/fpga/index.rst
>>     |   2 +
>>  drivers/fpga/altera-cvp.c                          |   8 +-
>>  drivers/fpga/altera-fpga2sdram.c                   |   8 +-
>>  drivers/fpga/altera-freeze-bridge.c                |  13 +--
>>  drivers/fpga/altera-hps2fpga.c                     |   7 +-
>>  drivers/fpga/altera-pr-ip-core.c                   |   9 +-
>>  drivers/fpga/altera-ps-spi.c                       |  11 +-
>>  drivers/fpga/dfl-fme-br.c                          |  11 +-
>>  drivers/fpga/dfl-fme-mgr.c                         |  11 +-
>>  drivers/fpga/dfl-fme-region.c                      |  10 +-
>>  drivers/fpga/dfl.c                                 |   6 +-
>>  drivers/fpga/fpga-bridge.c                         |  74 +++++++++++--
>>  drivers/fpga/fpga-mgr.c                            |  67 ++++++++++--
>>  drivers/fpga/fpga-region.c                         |  68 ++++++++++--
>>  drivers/fpga/ice40-spi.c                           |  10 +-
>>  drivers/fpga/machxo2-spi.c                         |  11 +-
>>  drivers/fpga/of-fpga-region.c                      |   9 +-
>>  drivers/fpga/socfpga-a10.c                         |   5 +-
>>  drivers/fpga/socfpga.c                             |  10 +-
>>  drivers/fpga/ts73xx-fpga.c                         |  11 +-
>>  drivers/fpga/xilinx-pr-decoupler.c                 |   4 +-
>>  drivers/fpga/xilinx-spi.c                          |  12 +-
>>  drivers/fpga/zynq-fpga.c                           |   5 +-
>>  include/linux/fpga/fpga-bridge.h                   |   4 +
>>  include/linux/fpga/fpga-mgr.h                      |  22 +++-
>>  include/linux/fpga/fpga-region.h                   |   4 +
>>  31 files changed, 437 insertions(+), 331 deletions(-)
>>  create mode 100644 Documentation/driver-api/fpga/fpga-programming.rst
>
>
> --
> Federico Vaga
> [BE-CO-HT]
>
>
