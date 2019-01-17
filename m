Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 91BCF7D161
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Jan 2019 14:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfAQOrt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Jan 2019 09:47:49 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33455 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfAQOrt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jan 2019 09:47:49 -0500
Received: by mail-wm1-f66.google.com with SMTP id r24so1242695wmh.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Jan 2019 06:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3Z932+bUN2NrjzHFwKIthg0K6iUxuRA6Dyq6+sEI2Ac=;
        b=kez2icuwYn9hKaOJda5fsSf6X7AK/3SLLVY43GTAs3OkizBZA6oGJ2nNorQR3KfqU8
         iF2hYU/NN3Ckzp8s/ap8JbH/M9Edcer4jHQgOG+3hOGu0959tRcsihf7hPOVj4KCAnW4
         x+f9B9wIQcFNcoWHGndzdXyvpjCnbLNRzk8vgzW65WL2d3ENmslfwNNxeK4Ie0uno1jN
         YFM3mR6svPG33JsNBE6RWoB/wHDs8lCxNOBfEFmmlnByB2HAsGZT1jVFQySA7Y8nJFQX
         4+XuSGWdUXrkmABmzjLT/kCIXfNGsEiewsKNYb4Du0E5iAGS9lxT6Bpbkaoe709Ch4eQ
         q8tA==
X-Gm-Message-State: AJcUukfCppb76RoSq6EcQ0ulsn7KiomJGUb1Af92a3MkILyfCzWW0/mN
        Y+iy3JYEzoMlGgIpD5nZIPl2CQ==
X-Google-Smtp-Source: ALg8bN7jRrC4WUXpHG+CEkLGw14ik0Xy5n7TGTPjQodfcTd6+7O1+nkJMQ/+CzfQ87pq85z5XZcgDw==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr12178463wmk.149.1547736467104;
        Thu, 17 Jan 2019 06:47:47 -0800 (PST)
Received: from localhost.localdomain ([151.15.254.62])
        by smtp.gmail.com with ESMTPSA id x81sm40888577wmg.17.2019.01.17.06.47.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jan 2019 06:47:46 -0800 (PST)
Date:   Thu, 17 Jan 2019 15:47:44 +0100
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Quentin Perret <quentin.perret@arm.com>
Cc:     corbet@lwn.net, peterz@infradead.org, rjw@rjwysocki.net,
        mingo@redhat.com, morten.rasmussen@arm.com, qais.yousef@arm.com,
        patrick.bellasi@arm.com, dietmar.eggemann@arm.com,
        linux-doc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] PM / EM: Document the Energy Model framework
Message-ID: <20190117144744.GF14385@localhost.localdomain>
References: <20190110110546.8101-1-quentin.perret@arm.com>
 <20190110110546.8101-2-quentin.perret@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190110110546.8101-2-quentin.perret@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 10/01/19 11:05, Quentin Perret wrote:
> Introduce a documentation file summarizing the key design points and
> APIs of the newly introduced Energy Model framework.
> 
> Signed-off-by: Quentin Perret <quentin.perret@arm.com>

Looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Best,

- Juri
