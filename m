Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518103AFAE4
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 08:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907137; cv=none; b=hYfIxaXQUFXkrQXOmGCXtjdQwua6q8UV6Oz9z4CumyjlV8kZ+oV9hwlgXHcLz/0OvNAoKEadROlg02eLc5KBMNq9BjaER99oGeNspMchxaS/yqj1C/Fpq3dwgzJUt8hzvip/joQgyOFOta0coz5rw9g6LdLyJdfXQomnBY+sOi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907137; c=relaxed/simple;
	bh=ajvNFQRszeTPdN8XlHWWoiibBsW1/sKsa1xidqso6yg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xp9j7J/2pWnfndFbjs6PEDqAcf7WYv3TUfdS2UskJxcm/rE/Gc6wuo4htPanc+ukoxbWVLwDOiPFU9FINBPfoGiW5XDVPMjWQlmkTAqGKcuJHOKiSKY4E8ljbffMCo/Uk/GUWLs6s3+1zksLt0ZWYDM6XWNcrZWq8BO+PFs/BKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xXdr2MqU; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xXdr2MqU"
Message-ID: <a58e659e-5f54-4511-9a29-dc921002d102@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780907123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g/cl94r2sn+iv8ffB105PChTgE1EOVBWGfW9oWrFA4E=;
	b=xXdr2MqUm4ZO5i3k+RxHcUjI4HpIhji3s70NJnUCFzQ1RESXVF1DKKPCbLWyRtNO1MLOHL
	RuI/3Yb+fiy5ZTTGzVhl/1ILrYag9MVjYJDIRSMkikfpV8kef9FWbLzkDtlKcDq2neBBzU
	xB/FcZW1UKV4zGpe09dq4VzJX+EHLJA=
Date: Mon, 8 Jun 2026 16:24:50 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 4/6] alloc_tag: add accuracy based filtering to ioctl
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Ge <hao.ge@linux.dev>
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
References: <cover.1780701922.git.abhishekbapat@google.com>
 <b608a6f7d71e3b728f766dbc6dfa1d1753ddcff5.1780701922.git.abhishekbapat@google.com>
 <1ec17313-cd2b-4389-a05d-998757af30b3@linux.dev>
Content-Language: en-US
In-Reply-To: <1ec17313-cd2b-4389-a05d-998757af30b3@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2026/6/8 14:22, Hao Ge wrote:
> Hi Abhishek
>
>
> On 2026/6/6 07:36, Abhishek Bapat wrote:
>> Extend the allocinfo filtering mechanism to allow users to filter tags
>> based on their accuracy.
>>
>> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
>> ---
>>   include/uapi/linux/alloc_tag.h | 3 +++
>>   lib/alloc_tag.c                | 8 ++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/include/uapi/linux/alloc_tag.h 
>> b/include/uapi/linux/alloc_tag.h
>> index 0e648192df4d..42445bdb11c5 100644
>> --- a/include/uapi/linux/alloc_tag.h
>> +++ b/include/uapi/linux/alloc_tag.h
>> @@ -20,6 +20,7 @@ struct allocinfo_tag {
>>       char function[ALLOCINFO_STR_SIZE];
>>       char filename[ALLOCINFO_STR_SIZE];
>>       __u64 lineno;
>> +    __u64 inaccurate;
>
>
> I was wondering if it would make sense to define inaccurate as a flags 
> field
>
> (e.g. __u64 flags with ALLOCINFO_TAG_F_INACCURATE (1 <<0)),
>
> so that only bit 0 is used today and the upper bits are reserved for 
> future use,
>
> aligning with current kernel codebase.
>
> This design also allows for better extensibility if we need to
>
> add new flags for any reason in the future.
>
> We also need to add flag validity checks if we go this route.
>
And I've reviewed the issue reported by Sashiko, and I think it's valid.

When we expand the allocinfo_tag_data structure

struct allocinfo_tag_data{

     char modname[64];

     char function[64];

     char filename[64];

     __u64 lineno;

     __u64 inaccurate;

     __u64 bytes;

     __u64 calls;

     __u8 accurate;
   /* padding */

}

I think user space may see two fields related to inaccuracy.

How do you like these modifications?


diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -20,7 +20,6 @@ struct allocinfo_tag {
      char function[ALLOCINFO_STR_SIZE];
      char filename[ALLOCINFO_STR_SIZE];
      __u64 lineno;
-    __u64 inaccurate;
  };

  /* The alignment ensures 32-bit compatible interfaces are not broken */
@@ -40,7 +39,7 @@ enum {
      ALLOCINFO_FILTER_FUNCTION,
      ALLOCINFO_FILTER_FILENAME,
      ALLOCINFO_FILTER_LINENO,
-    ALLOCINFO_FILTER_INACCURATE,
+    ALLOCINFO_FILTER_FLAGS,
      ALLOCINFO_FILTER_MIN_SIZE,
      ALLOCINFO_FILTER_MAX_SIZE,
      __ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -50,16 +49,20 @@ enum {
  #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 << 
ALLOCINFO_FILTER_FUNCTION)
  #define ALLOCINFO_FILTER_MASK_FILENAME        (1 << 
ALLOCINFO_FILTER_FILENAME)
  #define ALLOCINFO_FILTER_MASK_LINENO        (1 << ALLOCINFO_FILTER_LINENO)
-#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 << 
ALLOCINFO_FILTER_INACCURATE)
+#define ALLOCINFO_FILTER_MASK_FLAGS        (1 << ALLOCINFO_FILTER_FLAGS)
  #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 << 
ALLOCINFO_FILTER_MIN_SIZE)
  #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 << 
ALLOCINFO_FILTER_MAX_SIZE)

  #define ALLOCINFO_FILTER_MASKS \
      ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)

+#define ALLOCINFO_FILTER_F_INACCURATE    (1ULL << 0)
+#define ALLOCINFO_FILTER_FLAGS_ALL ALLOCINFO_FILTER_F_INACCURATE
+
  struct allocinfo_filter {
      __u64 mask; /* bitmask of the filter fields used */
      struct allocinfo_tag fields;
+    __u64 flags; /* bitmask of ALLOCINFO_FILTER_F_* */
      __u64 min_size;
      __u64 max_size;
  };
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -249,8 +249,6 @@ static bool matches_filter(struct codetag *ct, 
struct allocinfo_filter *filter,
                 struct alloc_tag_counters *counters,
                 bool *fetched_counters)
  {
-    bool inaccurate;
-
      if (!filter || !filter->mask)
          return true;

@@ -277,10 +275,11 @@ static bool matches_filter(struct codetag *ct, 
struct allocinfo_filter *filter,
          ct->lineno != filter->fields.lineno)
          return false;

-    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
-        inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
-        if (inaccurate != !!(filter->fields.inaccurate))
-            return false;
+    if (filter->mask & ALLOCINFO_FILTER_MASK_FLAGS) {
+        if (filter->flags & ALLOCINFO_FILTER_F_INACCURATE) {
+            if (!(ct->flags & CODETAG_FLAG_INACCURATE))
+                return false;
+        }
      }

      if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | 
ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
@@ -318,6 +317,10 @@ static int allocinfo_ioctl_get_at(struct seq_file 
*m, void __user *arg)
      if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
          return -EINVAL;

+    if ((params.filter.mask & ALLOCINFO_FILTER_MASK_FLAGS) &&
+        (params.filter.flags & ~ALLOCINFO_FILTER_FLAGS_ALL))
+        return -EINVAL;
+
      if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
          (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
          params.filter.min_size > params.filter.max_size)


Thanks

Best Regards

Hao


>
> Thanks
>
> Best Regards
>
> Hao
>
>
>>   };
>>     /* The alignment ensures 32-bit compatible interfaces are not 
>> broken */
>> @@ -39,6 +40,7 @@ enum {
>>       ALLOCINFO_FILTER_FUNCTION,
>>       ALLOCINFO_FILTER_FILENAME,
>>       ALLOCINFO_FILTER_LINENO,
>> +    ALLOCINFO_FILTER_INACCURATE,
>>       ALLOCINFO_FILTER_MIN_SIZE,
>>       ALLOCINFO_FILTER_MAX_SIZE,
>>       __ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
>> @@ -48,6 +50,7 @@ enum {
>>   #define ALLOCINFO_FILTER_MASK_FUNCTION        (1 << 
>> ALLOCINFO_FILTER_FUNCTION)
>>   #define ALLOCINFO_FILTER_MASK_FILENAME        (1 << 
>> ALLOCINFO_FILTER_FILENAME)
>>   #define ALLOCINFO_FILTER_MASK_LINENO        (1 << 
>> ALLOCINFO_FILTER_LINENO)
>> +#define ALLOCINFO_FILTER_MASK_INACCURATE    (1 << 
>> ALLOCINFO_FILTER_INACCURATE)
>>   #define ALLOCINFO_FILTER_MASK_MIN_SIZE        (1 << 
>> ALLOCINFO_FILTER_MIN_SIZE)
>>   #define ALLOCINFO_FILTER_MASK_MAX_SIZE        (1 << 
>> ALLOCINFO_FILTER_MAX_SIZE)
>>   diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
>> index ddc6946f56ab..cbcd12c4ef9c 100644
>> --- a/lib/alloc_tag.c
>> +++ b/lib/alloc_tag.c
>> @@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct, 
>> struct allocinfo_filter *filter,
>>                  struct alloc_tag_counters *counters,
>>                  bool *fetched_counters)
>>   {
>> +    bool inaccurate;
>> +
>>       if (!filter || !filter->mask)
>>           return true;
>>   @@ -275,6 +277,12 @@ static bool matches_filter(struct codetag *ct, 
>> struct allocinfo_filter *filter,
>>           ct->lineno != filter->fields.lineno)
>>           return false;
>>   +    if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
>> +        inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
>> +        if (inaccurate != !!(filter->fields.inaccurate))
>> +            return false;
>> +    }
>> +
>>       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | 
>> ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
>>           if (!*fetched_counters) {
>>               *counters = allocinfo_prefetch_counters(ct);
