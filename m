Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4C1457D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 23:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753235AbeEVXap (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 19:30:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58260 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753100AbeEVXao (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 19:30:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 759F060C54; Tue, 22 May 2018 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527031843;
        bh=XQmjixTNPcZKLeXydcH2B169NWtEnwUM1djvwFu4xgE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=X8lZ1g+tM894UfbhXninojyILgxxhLb2Jkn4rlAZtP7SzaPGwvMdrioiS9g0n1mbI
         x3U8Y2LT/PBd0ix+IM8o3Fozi5jjsHLBZYY4p9S2iRnryFNrPa1c5Xp3/BaVPALfPB
         mmMWW7kbLShqm3qtkWKAkyOVs5PgOYF8J3UR5s4w=
Received: from [192.168.0.106] (cpe-174-109-247-98.nc.res.rr.com [174.109.247.98])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okaya@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CDDB6028C;
        Tue, 22 May 2018 23:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527031842;
        bh=XQmjixTNPcZKLeXydcH2B169NWtEnwUM1djvwFu4xgE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mXcdZFBU/k9F/ojYSWEePQnVxo+6qlJht2uDkmcdpInzSTxAtwdaZZtDzKeqso87u
         ni9LqTosZWvpaQ8+oWLkPOKl3FyJmmvsRAP7n42un+umT/MpZSYSYUeISGCZ5A28uK
         16va3qkf4dUiwjvkU84E1Rl+9INow0Lu0nisrWgA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CDDB6028C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=okaya@codeaurora.org
Subject: Re: [PATCH 2/5] PCI/AER: Add sysfs stats for AER capable devices
To:     Rajat Jain <rajatja@google.com>, "Alex G." <mr.nuke.me@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frederick Lawler <fred@fredlawl.com>,
        Oza Pawandeep <poza@codeaurora.org>,
        Keith Busch <keith.busch@intel.com>,
        Gabriele Paoloni <gabriele.paoloni@huawei.com>,
        Thomas Tai <thomas.tai@oracle.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-pci <linux-pci@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jes Sorensen <jsorensen@fb.com>, Kyle McMartin <jkkm@fb.com>,
        Rajat Jain <rajatxjain@gmail.com>
References: <20180522222805.80314-1-rajatja@google.com>
 <20180522222805.80314-3-rajatja@google.com>
 <dcbb2e92-722f-c178-efb7-8d99d4a9d99f@gmail.com>
 <CACK8Z6GNPa+15WLxJBUAZ2=+jfhtdz+85=41B56KWSWCHSnyGw@mail.gmail.com>
From:   Sinan Kaya <okaya@codeaurora.org>
Message-ID: <9861c339-6784-c7ec-b1ec-6722fb0d5bd5@codeaurora.org>
Date:   Tue, 22 May 2018 19:30:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CACK8Z6GNPa+15WLxJBUAZ2=+jfhtdz+85=41B56KWSWCHSnyGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/22/2018 7:27 PM, Rajat Jain wrote:
>> What about AER errors that are contained by DPC?
> Thanks, You are right, this patch does not take care of the DPC. I'll
> try to read up on DPC and can integrate it if it turns out to be easy
> enough.
> 

I'd focus on AER for the moment. DPC is going through major restructuring
and will only handle AER_FATAL errors moving forward.

> Thanks,
> 
> Rajat
> 


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
