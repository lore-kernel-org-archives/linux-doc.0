Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A40CC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 15:26:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44CED60F11
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 15:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhHKP0k convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 11:26:40 -0400
Received: from mga14.intel.com ([192.55.52.115]:51055 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232791AbhHKP0f (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Aug 2021 11:26:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="214874237"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="214874237"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:26:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; 
   d="scan'208";a="516837152"
Received: from fbrausse-mobl.ger.corp.intel.com (HELO localhost) ([10.251.209.112])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 08:26:09 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: Hawkmoth & kernel-doc
In-Reply-To: <YPnD1vkOTDhktnei@casper.infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <YPnD1vkOTDhktnei@casper.infradead.org>
Date:   Wed, 11 Aug 2021 18:26:06 +0300
Message-ID: <87h7fwm29d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Jul 2021, Matthew Wilcox <willy@infradead.org> wrote:
> I really dislike the javadoc style, so at Jani's urging I gave Hawkmoth
> a try.  It's a little fiddly and a little buggy, but I think it
> encourages better-written documentation.

Hi, sorry about the long delay, been off the grid a bit.

I doubt I would have urged you to try Hawkmoth for kernel documentation
specifically, but rather more, uh, regular C projects, but I'll take
your word for it if you say so. ;D

Bug reports are always welcome at
https://github.com/jnikula/hawkmoth/issues

> I chose mm_inline.h as my victim.  It isn't currently included in the
> documentation, and it only has three kernel-doc comments in it to
> convert.
>
> I'm approximating what firefox displays here ...
>
> int page_is_file_lru(struct page *page)
>
>   Should the page be on a file LRU or anon LRU?
>
>     Parameters:  * page – The page to test.
>
>     We would like to get this info without a page flag, but the state
>     needs to survive until the page is last deleted from the LRU, which
>     could be as far down as __page_cache_release.
>
>     Returns:
>
>              An integer (not a boolean!) used to sort a page onto the right
>              LRU list and to account folios correctly.
>
>              * 1 if @page is a regular filesystem backed page cache page or a lazily freed anonymous page (e.g. via MADV_FREE).
>              * 0 if @page is a normal anonymous page, a tmpfs page or otherwise ram or swap backed page.
>
> That's not _bad_.

The main difference between kernel-doc and Hawkmoth is that the latter
does not try to parse the documentation comment at all, apart from
removing the comment markers. It's expected to be pure rst, and it's fed
to Sphinx as-is. What I'm saying is that what the output ends up being
is not in the control of Hawkmoth, it's between the rst and Sphinx.

> 1. 'Parameters' is indented further than kernel-doc does (2 levels of
>    indent, rather than 0)

With Hawkmoth, it's whatever Sphinx and doctools generate from pure rst
field lists.

> 2. Output:
> <dd><p>Should the page be on a file LRU or anon LRU?</p>
> <dl class="field-list simple">
> <dt class="field-odd">Parameters</dt>
> <dd class="field-odd"><ul class="simple">
> <li><p><strong>page</strong> – The page to test.</p></li>
> </ul>
> </dd>
> </dl>
> having gone to the trouble of using a <dl>, I feel that each parameter
> should be a <dt> and its definition a <dd>.  That seems to be what
> kernel-doc is doing.

Ditto. kernel-doc does not use field lists.

> 3. kernel-doc includes the type of the parameter in the definition,
>    while hawkmoth drops it.  I'm ambivalent about which is better.

kernel-doc generates that information, while Hawkmoth sticks to pure
rst.

> 4. It seems that the indentation of the 'Returns:' paragraph is a bit
>    too deep, but it did get the list correct.

Hmm, I think it should be similar to the parameters. See e.g.
https://hawkmoth.readthedocs.io/en/latest/examples.html#function

> 5. The second and third functions documented by hawkmoth lose their
>    parameter in the initial heading:
>
>
> int __clear_page_lru_flags()
>
>     Clear page lru flags before releasing a page.
>
>     Parameters  * page – The page that was on lru and now has a zero reference
>
> That first line really should have a 'struct page *page' in it.

That's indeed a bit odd.

> 6. There's also a warning from the build:
>
> /home/willy/kernel/linux/Documentation/core-api/mm-api.rst:101: WARNING: /home/willy/kernel/linux/include/linux/mm_inline.h:5: 'linux/huge_mm.h' file not found
>
> Looks like I can probably pass arbitrary flags to clang to get it to
> find that file, but I'm not sure whether I should.
>
> Here's the diff against current Linus tree that I'm working with:
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 7d92ec3e5b6e..13fcce3ec18d 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -39,7 +39,7 @@ needs_sphinx = '1.7'
>  extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
>                'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
>                'maintainers_include', 'sphinx.ext.autosectionlabel',
> -              'kernel_abi', 'kernel_feat']
> +              'kernel_abi', 'kernel_feat', 'hawkmoth']
>  
>  if major >= 3:
>      if (major > 3) or (minor > 0 or patch >= 2):
> @@ -104,6 +104,7 @@ if major >= 3:
>  else:
>      extensions.append('cdomain')
>  
> +cautodoc_root = os.path.abspath('..')
>  # Ensure that autosectionlabel will produce unique names
>  autosectionlabel_prefix_document = True
>  autosectionlabel_maxdepth = 2
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index adabb5c5798a..b724e29772b0 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -98,4 +98,5 @@ More Memory Management Functions
>     :internal:
>  .. kernel-doc:: include/linux/mm.h
>     :internal:
> +.. c:autodoc:: include/linux/mm_inline.h
>  .. kernel-doc:: include/linux/mmzone.h
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 355ea1ee32bd..7db1193a0d94 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -6,18 +6,21 @@
>  #include <linux/swap.h>
>  
>  /**
> - * page_is_file_lru - should the page be on a file LRU or anon LRU?
> - * @page: the page to test
> + * Should the page be on a file LRU or anon LRU?
>   *
> - * Returns 1 if @page is a regular filesystem backed page cache page or a lazily
> - * freed anonymous page (e.g. via MADV_FREE).  Returns 0 if @page is a normal
> - * anonymous page, a tmpfs page or otherwise ram or swap backed page.  Used by
> - * functions that manipulate the LRU lists, to sort a page onto the right LRU
> - * list.
> + * :param page: The page to test.
>   *
>   * We would like to get this info without a page flag, but the state
>   * needs to survive until the page is last deleted from the LRU, which
>   * could be as far down as __page_cache_release.
> + *
> + * :return: An integer (not a boolean!) used to sort a page onto the right
> + *   LRU list and to account folios correctly.
> + *
> + *   - 1 if @page is a regular filesystem backed page cache page or a lazily
> + *     freed anonymous page (e.g. via MADV_FREE).
> + *   - 0 if @page is a normal anonymous page, a tmpfs page or otherwise ram or
> + *     swap backed page.

An alternative to using a bulleted list for different return values is
to use a separate :return: field list item for each.

For example,

 * :return: 1 if @page is a regular filesystem backed page cache page or a lazily
 *   freed anonymous page (e.g. via MADV_FREE).
 * :return: 0 if @page is a normal anonymous page, a tmpfs page or otherwise ram or
 *   swap backed page.

Obviously in this case you'd need to figure out where to put the first,
common sentence, so might not be so nice here.

BR,
Jani.


>   */
>  static inline int page_is_file_lru(struct page *page)
>  {
> @@ -39,8 +42,9 @@ static __always_inline void update_lru_size(struct lruvec *lruvec,
>  }
>  
>  /**
> - * __clear_page_lru_flags - clear page lru flags before releasing a page
> - * @page: the page that was on lru and now has a zero reference
> + * Clear page lru flags before releasing a page.
> + *
> + * :param page: The page that was on lru and now has a zero reference
>   */
>  static __always_inline void __clear_page_lru_flags(struct page *page)
>  {
> @@ -57,11 +61,12 @@ static __always_inline void __clear_page_lru_flags(struct page *page)
>  }
>  
>  /**
> - * page_lru - which LRU list should a page be on?
> - * @page: the page to test
> + * Which LRU list should a page be on?
> + *
> + * :param page: The page to test
>   *
> - * Returns the LRU list a page should be on, as an index
> - * into the array of LRU lists.
> + * :return: The LRU list a page should be on, as an index into the array
> + *          of LRU lists.
>   */
>  static __always_inline enum lru_list page_lru(struct page *page)
>  {
>

-- 
Jani Nikula, Intel Open Source Graphics Center
