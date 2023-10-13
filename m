Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261033C36
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F0C6BD;
	Fri, 13 Oct 2023 00:09:10 -0700 (PDT)
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 39D78Pj8021427;
	Fri, 13 Oct 2023 09:08:25 +0200
Date: Fri, 13 Oct 2023 09:08:25 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jiri Kosina <jikos@kernel.org>
Cc: Solar Designer <solar@openwall.com>,
        Vegard Nossum <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, security@kernel.org, corbet@lwn.net,
        workflows@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [RFC PATCH] Documentation: security-bugs.rst: linux-distros
 relaxed their rules
Message-ID: <ZSjs6aUM7ZSdwKQ5@1wt.eu>
References: <20231007140454.25419-1-w@1wt.eu>
 <5ae47535-b6e0-8b48-4d59-a167e37c7fcc@oracle.com>
 <20231007163936.GA26837@1wt.eu>
 <20231012215122.GA8245@openwall.com>
 <20231013034712.GC15920@1wt.eu>
 <nycvar.YFH.7.76.2310130853320.3534@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2310130853320.3534@cbobk.fhfr.pm>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 13, 2023 at 08:54:03AM +0200, Jiri Kosina wrote:
> On Fri, 13 Oct 2023, Willy Tarreau wrote:
> 
> > Jiri, does your Acked-by still stand with these adjustment ? If so, I'll
> > resend the updated version today or this week-end, as time permits.
> 
> As it doesn't change the spirit but pretty much just improves the wording, 
> my Ack still holds.

Perfect, thank you!
Willy
