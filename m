Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4672315B0
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 03:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B20E1B7;
	Thu, 12 Oct 2023 20:47:50 -0700 (PDT)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 39D3lCCr016307;
	Fri, 13 Oct 2023 05:47:12 +0200
Date: Fri, 13 Oct 2023 05:47:12 +0200
From: Willy Tarreau <w@1wt.eu>
To: Solar Designer <solar@openwall.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, security@kernel.org, corbet@lwn.net,
        workflows@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>, Jiri Kosina <jikos@kernel.org>
Subject: Re: [RFC PATCH] Documentation: security-bugs.rst: linux-distros
 relaxed their rules
Message-ID: <20231013034712.GC15920@1wt.eu>
References: <20231007140454.25419-1-w@1wt.eu>
 <5ae47535-b6e0-8b48-4d59-a167e37c7fcc@oracle.com>
 <20231007163936.GA26837@1wt.eu>
 <20231012215122.GA8245@openwall.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012215122.GA8245@openwall.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 11:51:22PM +0200, Solar Designer wrote:
> Hi all,
> 
> Thank you (especially Willy) for your effort on this.
> 
> Out of the 3 paragraphs, the first one looks good to me as-is, but for
> the last two I propose the slightly edited versions below.
> 
> On Sat, Oct 07, 2023 at 04:04:54PM +0200, Willy Tarreau wrote:
> > +Please note that the respective policies and rules are different since
> > +the 3 lists pursue different goals.  Coordinating between the kernel
> > +security team and other teams is difficult since occasional embargoes
> > +start from the availability of a fix for the kernel security team, while
> > +for other lists they generally start from the initial post to the list,
> > +regardless of the availability of a fix.
> 
> ---
> Please note that the respective policies and rules are different since
> the 3 lists pursue different goals.  Coordinating between the kernel
> security team and other teams is difficult since for the kernel security
> team occasional embargoes (as subject to a maximum allowed number of
> days) start from the availability of a fix, while for "linux-distros"
> they start from the initial post to the list regardless of the
> availability of a fix.
> ---
> 
> I added the part in braces to explain why the difference in when
> embargoes start matters.  I also moved part of that sentence for
> consistency.  Finally, I replaced "other lists" with specific reference
> to "linux-distros" because this paragraph talks only about 3 specific
> lists and on "oss-security" there are no embargoes.

It's fine by me as it doesn't change the spirit but improves the wording.

> On Sat, Oct 07, 2023 at 06:39:36PM +0200, Willy Tarreau wrote:
> > On Sat, Oct 07, 2023 at 06:30:11PM +0200, Vegard Nossum wrote:
> > > On 07/10/2023 16:04, Willy Tarreau wrote:
> > > > +As such, the kernel security team strongly recommends that reporters of
> > > > +potential security issues DO NOT contact the "linux-distros" mailing
> > > > +list BEFORE a fix is accepted by the affected code's maintainers and you
> > > 
> > > is s/BEFORE/UNTIL/ clearer?
> > 
> > Probably, yes.
> 
> I agree.  Also, the sentence jumps from "reporters" to "you" implying
> that "you" is a reporter, but maybe it's better to make that explicit.

Ah, I hate doing this, I generally avoid "you" and "we" in docs but
given these ones are instructions it's easy to fall in the trap. I'll
try to improve it.

> > > > +have read the linux-distros wiki page above and you fully understand the
> > > > +requirements that doing so will impose on you and the kernel community.
> > > > +This also means that in general it doesn't make sense to Cc: both lists
> > > > +at once, except for coordination if a fix remains under embargo. And in
> > > > +general, please do not Cc: the kernel security list about fixes that
> > > > +have already been merged.
> 
> This implies that in general a fix does not remain under embargo.

This is most often the case.

> However, contacting "linux-distros" only makes sense when a fix does
> remain under embargo (either not yet pushed to a public list/repo, or
> under the Linux kernel exception for a public not-too-revealing fix) -
> otherwise, the issue should be brought to "oss-security" right away.
> 
> Edited:
> 
> ---
> As such, the kernel security team strongly recommends that as a reporter
> of a potential security issue you DO NOT contact the "linux-distros"
> mailing list UNTIL a fix is accepted by the affected code's maintainers
> and you have read the distros wiki page above and you fully understand
> the requirements that contacting "linux-distros" will impose on you and
> the kernel community.  This also means that in general it doesn't make
> sense to Cc: both lists at once, except maybe for coordination if and
> while an accepted fix has not yet been merged.  In other words, until a
> fix is accepted do not Cc: "linux-distros", and after it's merged do not
> Cc: the kernel security team.
> ---
> 
> This allows possible Cc'ing of both lists in the time window between
> "fix is accepted by the affected code's maintainers" and "merged".
> Makes sense?  I worry this distinction between accepted and merged may
> be overly complicated for some, but I don't have better wording.

I think it's fine as is. I care a lot about giving clear instructions,
especially for first-time reporters, for whom it's always particularly
stressful to report a bug. With this update I think there's enough
guidance and it should help, so OK for me.

> > > I guess the problem with this would be if
> > > somebody on s@k.o does a reply-all which would add distros right back in
> > > the loop -OR- a patch has already been developed and included.
> > 
> > Then this would be deliberate, there would an in-reply-to so that would
> > not be a problem. I really doubt anyone from s@k.o would Cc linux-distros
> > anyway since it would imply disclosing some details from a reporter, and
> > we do not do that, it's up to the reporter to do it if they want.
> 
> I think we don't want to complicate the setup, which we'd then have to
> explain somewhere.  With my concern/edit above, also the logic isn't
> that simple.

Agreed, let's leave it to the reporter to do what they want with the
instructions above and be done with it.

Jiri, does your Acked-by still stand with these adjustment ? If so, I'll
resend the updated version today or this week-end, as time permits.

Thanks!
Willy
