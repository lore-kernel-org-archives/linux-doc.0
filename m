Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6BA0B7E244
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 18:47:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1161011AbeCASrM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 13:47:12 -0500
Received: from mail-qk0-f174.google.com ([209.85.220.174]:42113 "EHLO
        mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034056AbeCASrL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 13:47:11 -0500
Received: by mail-qk0-f174.google.com with SMTP id b130so8833382qkg.9;
        Thu, 01 Mar 2018 10:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=kkB1Lw4v6blQDoxfwAgoaJ/zeDDIsxw0oML2Zx8wi80=;
        b=OfwDeYCDKmZcZzPALMHJ3aCjnae+pkR2QE4hcwoayPNYPexZ50lgegTbR+zHg+GrFN
         XlD7nkDifAM9J+BErLR9rEJkT9EcLEMu3dEPoKIXug2ZesxCC0onudoTWeAmjV92aLB4
         Ci1pa33NcZGwM7issmKeZ/x+GrM7bvczX/CPUvnJt3kcYEhdrbes7TyB8E02zWvoCQkh
         OUYe0d+6qyvBqRI//W7XG/mautZxO+hnqu2Ur2EcFgCWBYgnuGbwGcOSWwXz50NV9owe
         KQI2r2/thY8kK47MoaY6u/n/xioWBEMy/Um7VxgfUoMFZk6hf7aYuoOL1XasToRh3ILz
         X9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=kkB1Lw4v6blQDoxfwAgoaJ/zeDDIsxw0oML2Zx8wi80=;
        b=HHhAq+KIKvwh5Cuo4d96LalGG0n8ztrZmouIy5Vr9+JFmhiBf6ex7hEQyhn7wrH1Pg
         Z3mC4KTQ6ycw0QGeqTq69VRd1lYkzQhbKh/XGoGjFDYjuWLB9/R1FSo47euYGslXGXTd
         U6WSK8JsaVLGDI7bfoK/G7i8uIEpdBPvxstoAqD9tW1tNvyAk3FvGD3n5cyxYwXVn6Mt
         8EC/UrQGf7Vp+kxYTa6A70AGhxXxoXnZssRp+NcnZdEYKKjIpS4yLR2R8C2ugFOxlr5W
         05h1sKnMgbgIy2e5nUcxda24l8YSkYMujQSHPlBD4skjUOZfQvupSZ3E1gQVzJi5eWno
         F4YQ==
X-Gm-Message-State: AElRT7G+pM5etQCLrukP0l0BVgxiWlDmEF0r0UlzWD2MeGl8dkHScIFu
        kllVsz2sVDU7V90EPMjNIur8foE+ia+xnflSxlo=
X-Google-Smtp-Source: AG47ELsPVl9POkTqA04o6pqiv2Lt1uBIDZy5z6loSLJsV/QCKGXu7GRFnj/SH4/2al5BYcGqkHOgM0DiRpFKmiuG8ko=
X-Received: by 10.55.209.217 with SMTP id o86mr4061603qkl.33.1519930030313;
 Thu, 01 Mar 2018 10:47:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.195.80 with HTTP; Thu, 1 Mar 2018 10:47:09 -0800 (PST)
In-Reply-To: <20180301184335.248378-1-djkurtz@chromium.org>
References: <20180301184335.248378-1-djkurtz@chromium.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Mar 2018 20:47:09 +0200
Message-ID: <CAHp75VfHuNHnjMqsvLZPSNeP57YX1CDZgf=EH-JNSh5bAVdUBA@mail.gmail.com>
Subject: Re: [PATCH v2] earlycon: Allow specifying a uartclk in options
To:     Daniel Kurtz <djkurtz@chromium.org>
Cc:     adurbin@chromium.org, Brian Norris <briannorris@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Tom Saeger <tom.saeger@oracle.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 1, 2018 at 8:43 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:

Please, hold on with new versions.
I'm not satisfied (yet?) by the approach.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
