Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 000C07D048
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 22:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751955AbeFSW3T (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 18:29:19 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:56316 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbeFSW3R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 18:29:17 -0400
Received: by mail-it0-f66.google.com with SMTP id 16-v6so2718831itl.5;
        Tue, 19 Jun 2018 15:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8Q0gaw4s6fU4uI11jgpPKhFrJnvVs+Pg7ej2nsbAVmc=;
        b=vJO8Fy6jlwhK96ONSYvn5peXE/putDuv+MXxWvMAl1dskhD/GigPt0pOLERoEG4TOi
         dXL36SnOmKOXl8ezOb9FpPlfz2eMSMEc+V2zpE+Ic0TdgzhCAkPbbgWFnm/JjoSrHPBh
         uNJ0FCZgodiw0QXgqnZMK5IPN4hu9ZmUfWtb3hz2v0lDuPDA6z+PcDdH3XICJsyurfHF
         wEXyN7gKf4ZykqQ3kUh2jGNArb/Jvz1ioFy1gAt6VMg4iHIDXk+/+S0EhuOe1kM3WKtG
         XxUC4pqCzOWAxrIHT1XkbB04O7DvAMhqlB2GhO5xBUU2jT9BAdvL47jE5/w815+80SBE
         KCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8Q0gaw4s6fU4uI11jgpPKhFrJnvVs+Pg7ej2nsbAVmc=;
        b=tXtZKS0uJqEae31qpDMp3tTh05AAte92UC65Cy2jlhD9nUVl8WmoYs042S1EXRq6Dv
         atHPZc1AWfXCr+c1NKUnFZW8DtuUwHdcdWJTB8EH1PhGUmVM2gaJ5c8SFTMe+Jr93T7V
         sZErSIgZXSgEpLDMEmNyckpdIS7yK2/lvT2hfAH71qZtnOexd8SuzfFSXH1NQ6kO+1FR
         Jsrv3Gh5/i4eAHkmabk9q2Fcn1xcOWIja1kzH3mHNAuJANZ+e7s8rHh9dMQFxBx/pFUw
         5oX2TObzArFvAec7r3gsMzMfL6kfUw020JY/gIQrPf4eyhHnSThNOHV43RS9iBtjBHFM
         hmCw==
X-Gm-Message-State: APt69E2uQ1ouGbGkXC2/RySrco6gu+xO0nbPs+xeklsxNHaAh5zxMC/Y
        jOIUJBvr5lJtVjTMfpFUbRU=
X-Google-Smtp-Source: ADUXVKJj+XuapwKmLGLcntnhmP1SMFGoqJdtm4v9IVfku+3puNYTIgLRfFlFJt5SYkqjb31De+oj3g==
X-Received: by 2002:a24:e105:: with SMTP id n5-v6mr14646357ith.68.1529447357070;
        Tue, 19 Jun 2018 15:29:17 -0700 (PDT)
Received: from nuclearis2_1.gtech (c-98-201-114-184.hsd1.tx.comcast.net. [98.201.114.184])
        by smtp.gmail.com with ESMTPSA id i10-v6sm518081itb.38.2018.06.19.15.29.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jun 2018 15:29:16 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] Expose PCIe AER stats via sysfs
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Thomas Tai <thomas.tai@oracle.com>, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jes Sorensen <jsorensen@fb.com>, Kyle McMartin <jkkm@fb.com>,
        rajatxjain@gmail.com
References: <20180522222805.80314-1-rajatja@google.com>
 <20180523175808.28030-1-rajatja@google.com>
 <20180619221651.GH33049@bhelgaas-glaptop.roam.corp.google.com>
 <c6a5f1ca-a3da-4dd8-1178-a017d6d771c6@gmail.com>
 <20180619182536.648e763f@gandalf.local.home>
From:   "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <2d4befa5-2b34-a4eb-f1c2-5b80c8a23f83@gmail.com>
Date:   Tue, 19 Jun 2018 17:29:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180619182536.648e763f@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 06/19/2018 05:25 PM, Steven Rostedt wrote:
> On Tue, 19 Jun 2018 17:20:28 -0500
> "Alex G." <mr.nuke.me@gmail.com> wrote:
> 
>> I see the next phoronix headline:
>>
>> "Linux maintainer breaks things and watches in amusement as contributors
>> rush to the fix"
> 
> But isn't this the daily routine of every Linux maintainer?

Phoronix wrote articles about much less interesting things than that.

Alex
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
